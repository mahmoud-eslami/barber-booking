import 'dart:async';
import 'dart:io';

import 'package:barber_booking/app/data/model/appointments/appointments.dart';
import 'package:barber_booking/app/data/model/barber/barber.dart';
import 'package:barber_booking/app/data/model/barber_shop/barber_shop.dart';
import 'package:barber_booking/app/data/model/post/post.dart';
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

  firebaseErrorHandler(e, s) {
    print(e);
    print(s);
    if (e is FirebaseAuthException) {
      switch (e.code) {
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
    } else if (e is SocketException) {
      throw internetConnectionError;
    } else {
      throw e.toString();
    }
  }

  Future<DocumentSnapshot?> getSnapShotFromRefrence(
      DocumentReference refrence) async {
    try {
      return await refrence.get();
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return null;
    }
  }

  Future<List<AppointmentsModel>> getAppointments() async {
    List<AppointmentsModel> appointmentsList = [];
    List<Map> rawData = [];
    List<Future> rawFutures = [];
    List completedFutures = [];
    try {
      User? user = _auth.currentUser;
      if (user == null) throw "User not exist";
      QuerySnapshot appointments = await _firestore
          .collection("users")
          .doc(user.uid)
          .collection("appointments")
          .get();

      // add all futures to a raw list
      for (var element in appointments.docs) {
        Map data = element.data() as Map;
        rawFutures.add(getSnapShotFromRefrence(data["barberShop"]));
      }

      // get list of completed futures
      completedFutures.addAll(await Future.wait(rawFutures));

      for (var i = 0; i < appointments.docs.length; i++) {
        Map data = appointments.docs[i].data() as Map;
        rawData.add({
          "appointmentTime": data["appointmentTime"],
          "barberShop": completedFutures[i],
        });
      }

      for (var element in rawData) {
        appointmentsList.add(AppointmentsModel.fromJson(element));
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
    return appointmentsList;
  }

  Future<StoryModel?> getSpeceficData(String storyId) async {
    try {
      DocumentSnapshot story =
          await _firestore.collection("story").doc(storyId).get();

      return StoryModel.fromJson(story);
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
    return null;
  }

  Future<bool?> checkBarberShopLikeStatus(String id) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) throw "User not exist";
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(user.uid).get();
      List favBarberShops = doc["favouriteBarberShops"];
      return (favBarberShops.contains(id)) ? true : false;
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return null;
    }
  }

  Future<void> likeBarberShop(String id) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) throw "User not exist";
      bool? isExist = await checkBarberShopLikeStatus(id);
      if (isExist == null) throw unknownError;
      if (isExist) {
        await _firestore.collection("users").doc(user.uid).update({
          'favouriteBarberShops': FieldValue.arrayRemove([id]),
        });
      } else {
        await _firestore.collection("users").doc(user.uid).update({
          'favouriteBarberShops': FieldValue.arrayUnion([id]),
        });
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
    }
  }

  Future<bool> seenStory(String storyId) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw "Please first login";
      } else {
        return _firestore.collection("story").doc(storyId).update({
          "seens": FieldValue.arrayUnion([user.uid])
        }).then((value) => true);
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return false;
    }
  }

  Future likeStory(String storyId) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw "Please first login";
      } else {
        DocumentSnapshot storyData =
            await _firestore.collection("story").doc(storyId).get();
        List likes = storyData["likes"];
        if (likes.contains(user.uid)) {
          await _firestore.collection("story").doc(storyId).update({
            "likes": FieldValue.arrayRemove([user.uid])
          }).then((value) => true);
        } else {
          await _firestore.collection("story").doc(storyId).update({
            "likes": FieldValue.arrayUnion([user.uid])
          }).then((value) => true);
        }
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return false;
    }
  }

  Future commentOnStory(String storyId, String comment) async {
    try {
      User? user = _auth.currentUser;
      if (user == null) {
        throw "Please first login";
      } else {
        return _firestore.collection("story").doc(storyId).update({
          "comments": FieldValue.arrayUnion(["${user.uid}/$comment"])
        }).then((value) => true);
      }
    } catch (e, s) {
      firebaseErrorHandler(e, s);
      return false;
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

  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> list = [];
    List<Future> rawFutures = [];
    List completedFutures = [];
    try {
      QuerySnapshot posts = await _firestore.collection('posts').get();

      // add refrence to raw list
      for (var element in posts.docs) {
        Map data = element.data() as Map;
        rawFutures.add(getSnapShotFromRefrence(data["barber"]));
      }

      completedFutures.addAll(await Future.wait(rawFutures));

      for (var i = 0; i < posts.docs.length; i++) {
        list.add(
          PostModel.fromJson(
            doc: posts.docs[i],
            barberData: completedFutures[i],
          ),
        );
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
