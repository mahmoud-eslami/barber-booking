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
  String unknownError = 'Something went wrong , please try again.';
  String userNotFoundError = 'No user found for that email.';
  String wrongPwdError = 'Wrong password provided for that user.';

  firebaseErrorHandler(FirebaseAuthException error) {
    switch (error.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        throw "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        throw "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        throw "No user found with this email.";
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
        throw "Operation failed. Please try again.";
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
    } on FirebaseAuthException catch (e) {
      firebaseErrorHandler(e);
    } on SocketException catch (e) {
      throw internetConnectionError;
    } catch (e) {
      throw unknownError;
    }
  }

  Future registerUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      firebaseErrorHandler(e);
    } on SocketException catch (e) {
      throw internetConnectionError;
    } catch (e) {
      throw unknownError;
    }
  }

  Future loginUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      firebaseErrorHandler(e);
    } on SocketException catch (e) {
      throw internetConnectionError;
    } catch (e) {
      throw unknownError;
    }
  }
}
