import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = Get.find();

  // errors strings
  String weakPwdError = 'The password provided is too weak.';
  String emailUseError = 'The account already exists for that email.';
  String internetConnectionError = 'Please check your internet connection';
  String unknownError = "Operation failed. Please try again.";
  String userNotFoundError = 'No user found for that email.';
  String wrongPwdError = 'Wrong password provided for that user.';
  String userNotExistError = "No user found with this email.";

  firebaseErrorHandler(error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          throw emailUseError;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          throw wrongPwdError;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          throw userNotExistError;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          throw "User disabled.";
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          throw "Too many requests to log into this account.";
        case "ERROR_OPERATION_NOT_ALLOWED":
          throw "Server error, please try again later.";
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          throw "Email address is invalid.";
        default:
          throw unknownError;
      }
    } else if (error is SocketException) {
      throw internetConnectionError;
    } else {
      throw unknownError;
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on SocketException {
      throw internetConnectionError;
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  Future registerUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on SocketException {
      throw internetConnectionError;
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  Future loginUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on SocketException {
      throw internetConnectionError;
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  User? getUser() {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      firebaseErrorHandler(e);
    }
    return null;
  }

  Future<bool> updateUserInfo(
      {String? email, String? name, String? photo}) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        if (email != null) user.updateEmail(email);
        if (name != null) user.updateDisplayName(name);
        if (photo != null) user.updatePhotoURL(photo);
      }
      return true;
    } catch (e) {
      firebaseErrorHandler(e);
      return false;
    }
  }

  Future checkUserState() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  Future checkUserVerificationState() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (user.emailVerified) {
          return true;
        } else {
          return false;
        }
      } else {
        throw userNotExistError;
      }
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  Future sendVerificationEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
      } else {
        throw userNotExistError;
      }
    } catch (e) {
      firebaseErrorHandler(e);
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }
}
