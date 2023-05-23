// ignore_for_file: prefer_typing_uninitialized_variables, invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/screens/intro.dart';

import '../Utils/utils.dart';
import '../screens/home_page.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  late Rx<User?> firebaseUser;
//holds extra user data
  var firebaseUserData = {}.obs;
//from Utils
  var auth;
  var firestore;

  late CollectionReference users;

  @override
  void onReady() {
    super.onReady();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    // initialize user
    users = firestore.collection('users');
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUserData.value = {};
    //track user data changes
    firebaseUser.bindStream(auth.userChanges());
    //If user changes to null, send user to login screen
    //ever(firebaseUser, _setInitialScreen);
  }

  afterSplash() async {
    if (firebaseUser.value == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const Intro());
    } else {
      Utils.showLoading(message: "Fetching Profile...");
      var fsUser = await users.doc(firebaseUser.value?.uid).get();
      firebaseUserData.value.addAll(
          fsUser.data() == null ? {} : fsUser.data() as Map<String, dynamic>);
      update();
      Get.offAll(() => MyHomePage());
      Utils.dismissLoader();
    }
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (true) {
      if (user == null) {
        // if the user is not found then the user is navigated to the Register Screen
        Get.offAll(() => const Intro());
      } else {
        // if the user exists and logged in the the user is navigated to the Dashboard Screen
        Utils.showLoading(message: "Fetching Profile...");
        var fsUser = await users.doc(user.uid).get();
        firebaseUserData.value.addAll(
            fsUser.data() == null ? {} : fsUser.data() as Map<String, dynamic>);
        update();
        Get.offAll(() => MyHomePage());
        Utils.dismissLoader();
      }
    }
  }

  Future<bool> register(String fullName, String email, String password) async {
    Utils.showLoading(message: "Creating account…");
    try {
      await (auth as FirebaseAuth)
          .createUserWithEmailAndPassword(email: email, password: password);
      var user = auth.currentUser;
      if (user != null) {
        await (user as User).updateDisplayName(fullName);
        var fsUser = await users.doc(user.uid).get();

        if (!fsUser.exists) {
          await users.doc(user.uid).set({
            // ignore: unnecessary_string_interpolations
            "fullName": "$fullName",
            // ignore: unnecessary_string_interpolations
            "email": "$email",
          });
        }
        Utils.showSuccess("Signup Successful!");
        Utils.dismissLoader();

        return true;
      } else {
        Utils.showError("Signup Failed!");
        Utils.dismissLoader();

        return false;
      }
    } catch (firebaseAuthException) {
      print((firebaseAuthException as FirebaseAuthException).message);
      Utils.showError("Signup Failed!");
      Utils.dismissLoader();
      return false;
    }
  }

  Future<bool> login(String email, password) async {
    Utils.showLoading(message: "Authenticating…");

    try {
      await (auth as FirebaseAuth)
          .signInWithEmailAndPassword(email: email, password: password);
      var user = auth.currentUser;

      if (user != null) {
        Utils.showSuccess("Login Successful!");
        Utils.dismissLoader();
        return true;
      }
    } catch (firebaseAuthException) {
      print((firebaseAuthException as FirebaseAuthException).message);

      Utils.showError("Login  Failed!");
      Utils.dismissLoader();
      return false;
    }
    Utils.dismissLoader();
    return false;
  }

  Future signOut() async {
    Utils.showLoading(message: "Signing out…");

    await auth.signOut();
    Utils.dismissLoader();
  }
}
