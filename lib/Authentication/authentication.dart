//import 'package:flutter/material.dart';
import 'package:figma/home_page.dart';
import 'package:figma/login_page.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  //will be load when app launches this func will be called and set the firebaseuser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  //setting initial screen onLoad
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => LoginPage()) : Get.offAll(() => HomePage());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar('Error', 'The provided phone numbern is not valid.');
        } else {
          Get.snackbar('error', 'something went wrong. Try again.');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  // Future<String?> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     firebaseUser.value != null
  //         ? Get.offAll(() => HomePage())
  //         : Get.to(() => LoginPage());
  //   } on FirebaseAuthException catch (e) {
  //     final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = SignUpWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  // Future<String?> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = LogInWithEmailAndPasswordFailure.code(e.code);
  //     return ex.message;
  //   } catch (_) {
  //     const ex = LogInWithEmailAndPasswordFailure();
  //     return ex.message;
  //   }
  //   return null;
  // }

  Future<void> logout() async => await _auth.signOut();
}
