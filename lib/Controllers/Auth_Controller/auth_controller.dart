import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var isPasswordHidden = true.obs;
  final box = GetStorage();
  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  final RxString error = ''.obs;

  Future<void> registerUser({
    required String id,
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Invalid email format");
      return;
    }

    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      // Save data locally
      box.write('email', email);
      box.write('name', name);
      box.write("mobile", mobile);
      box.write('id', id);
      Get.snackbar("Success", "Registration complete",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,);
      Get.offAllNamed('/home');
     // Get.offAll("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar("Registration Failed", "Email already in use. Try other Email.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,);
      } else {
        Get.snackbar("Registration Failed", e.message ?? "An error occurred",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black,);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,);
    }

  }


  void login(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      box.write('email', email);
      box.write('name', email);
      Get.snackbar("Login","Success",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is invalid.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many login attempts. Please try again later.';
          break;
        case 'network-request-failed':
          errorMessage = 'Network error. Please check your internet connection.';
          break;
        default:
          errorMessage = 'Login failed. Please try again.';
      }

      Get.snackbar(
        'Login Error',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    } finally {
      isLoading.value = false;
    }
  }


  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed('/login'); // Navigate back to login
  }

}
