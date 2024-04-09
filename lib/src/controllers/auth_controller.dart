import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emcus_ble/src/models/user_details_model.dart';
import 'package:emcus_ble/src/views/auth_views/sign_in_view.dart';
import 'package:emcus_ble/src/views/home_views/bottom_navigation_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  RxBool isloading = false.obs;

  registerUser(
      {required UserDataModel userDataModel, required String password}) async {
    isloading(true);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userDataModel.email,
        password: password,
      );
      String userId = credential.user!.uid;
      storeUserDetails(uid: userId, userDataModel: userDataModel);
    } on FirebaseAuthException catch (e) {
      isloading(false);
      print(e.code);
      if (e.code == 'weak-password') {
        Get.rawSnackbar(
            message: 'The password provided is too weak.',
            backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        Get.rawSnackbar(
            message: 'The account already exists for that email.',
            backgroundColor: Colors.red);
      } else if (e.code == "invalid-email") {
        Get.rawSnackbar(
            message: 'Enter a valid Email.', backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
      Get.rawSnackbar(
        message: 'Something went wrong. Please try again',
      );
    }
  }

  loginUser({required String email, required String password}) async {
    isloading(true);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isloading(false);
      Get.offAll(() => BottomNavBarView());
    } on FirebaseAuthException catch (e) {
      isloading(false);
      print("=============>>");
      print(e.code);
      if (e.code == 'user-not-found') {
        Get.rawSnackbar(
            message: 'No user found for that email.',
            backgroundColor: Colors.red);
      } else if (e.code == 'wrong-password') {
        Get.rawSnackbar(
            message: 'Wrong password provided for that user.',
            backgroundColor: Colors.red);
      } else if (e.code == "invalid-credential") {
        Get.rawSnackbar(
            message: 'Invalid email or password, Please try again.',
            backgroundColor: Colors.red);
      }
    }
  }

  checkIfUserIsLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAll(() => BottomNavBarView());
    } else {
      Get.offAll(() => SignInView());
    }
  }

  logoutUser() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => SignInView());
  }

  storeUserDetails(
      {required UserDataModel userDataModel, required String uid}) {
    users.doc(uid).set(userDataModel.toMap()).then((value) {
      isloading(false);
      Get.offAll(() => BottomNavBarView());
    }).catchError((error) {
      isloading(false);
      print("Failed to add user: $error");
    });
  }

  getUserData() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).get();
  }
}
