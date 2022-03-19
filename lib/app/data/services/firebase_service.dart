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
    } on SocketException catch (e) {
      return Future.error(internetConnectionError);
    } catch (e) {
      return Future.error(unknownError);
    }
  }

  Future registerUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error(weakPwdError);
      } else if (e.code == 'email-already-in-use') {
        return Future.error(emailUseError);
      }
    } on SocketException catch (e) {
      return Future.error(internetConnectionError);
    } catch (e) {
      return Future.error(unknownError);
    }
  }

  Future loginUser({required email, required password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Future.error(userNotFoundError);
      } else if (e.code == 'wrong-password') {
        Future.error(wrongPwdError);
      }
    } on SocketException catch (e) {
      Future.error(internetConnectionError);
    } catch (e) {
      Future.error(unknownError);
    }
  }
}
