import 'dart:async';
import 'dart:io';

import 'package:barber_booking/app/data/model/barber/barber.dart';
import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';
import 'package:barber_booking/app/data/model/story/story.dart';
import 'package:barber_booking/app/data/model/user/user_extra_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = Get.find();
  final FirebaseFirestore _firestore = Get.find();

  // errors strings
  String weakPwdError = 'The password provided is too weak.';
  String emailUseError = 'The account already exists for that email.';
  String internetConnectionError = 'Please check your internet connection';
  String unknownError = "Operation failed. Please try again.";
  String userNotFoundError = 'No user found for that email.';
  String wrongPwdError = 'Wrong password provided for that user.';
  String userNotExistError = "No user found with this email.";

  firebaseErrorHandler(error, stackTrace) {
    print(error);
    print(stackTrace);
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

  Future<List<StoryModel>> getAllStories() async {
    List<StoryModel> list = [];
    try {
      QuerySnapshot docs = await _firestore.collection("story").get();
      for (var element in docs.docs) {
        list.add(StoryModel.fromJson(element));
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }

    return list;
  }

  Future<BarberModel?> getSpeceficProfile(String docId) async {
    try {
      DocumentSnapshot document =
          await _firestore.collection("barber").doc(docId).get();

      if (!document.exists) {
        throw "This profile not existed";
      }
      return BarberModel.fromJson(document);
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return null;
    }
  }

  Future<List<BarberShopModel>> getAllBarberShops() async {
    List<BarberShopModel> barbersList = [];

    try {
      QuerySnapshot barberShops =
          await _firestore.collection("barbershops").get();

      for (var element in barberShops.docs) {
        barbersList.add(BarberShopModel.fromJson(element.data()));
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
    return barbersList;
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
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
  }

  Future registerUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on SocketException {
      throw internetConnectionError;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
  }

  Future loginUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on SocketException {
      throw internetConnectionError;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
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
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
    return null;
  }

  Future<UserExtraInfo?> getUserExtraInfo() async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection("users").doc(getUser()?.uid).get();

      UserExtraInfo userExtraInfo = UserExtraInfo.fromJson(userDoc.data());

      return userExtraInfo;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
    return null;
  }

  Future<bool> updateUserBaseInfo(
      {String? email, String? name, String? photo}) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        if (email != null) user.updateEmail(email);
        if (name != null) user.updateDisplayName(name);
        if (photo != null) user.updatePhotoURL(photo);
      }
      return true;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return false;
    }
  }

  Future<bool> updateUserExtraInfo({int? gender, int? age}) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String uid = user.uid;

        if (gender != null) {
          await _firestore
              .collection("users")
              .doc(uid)
              .update({"gender": gender});
        }
        if (age != null) {
          await _firestore.collection("users").doc(uid).update({"age": age});
        }
      } else {
        throw "User not active please logout and login again";
      }
      return true;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return false;
    }
  }

  Future createExtraInfoDocumetnation() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot doc =
            await _firestore.collection("users").doc(user.uid).get();

        if (!doc.exists) {
          await _firestore
              .collection("users")
              .doc(user.uid)
              .set({"gender": 3, "age": 0});
        }
      } else {
        throw "User not exist";
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
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
    } catch (e, s) {
      firebaseErrorHandler(e, s);
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
    } catch (e, s) {
      firebaseErrorHandler(e, s);
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
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
  }

  Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }
}
