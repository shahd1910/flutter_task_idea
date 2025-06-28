import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/models/user_model.dart';

class EditProfileController extends GetxController {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  var selectedGender = 'Male'.obs;

  var imageUrl = ''.obs;
  var isUploading = false.obs;

  Future<String?> uploadImageToCloudinary(String imagePath) async {
    try {
      final uri = Uri.parse(
        "https://api.cloudinary.com/v1_1/dt3mfq2g3/image/upload",
      );

      final request = http.MultipartRequest('POST', uri);
      request.fields['upload_preset'] = 'upload';
      request.files.add(await http.MultipartFile.fromPath('file', imagePath));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseData);
        return data['secure_url'];
      } else {
        Get.snackbar("Error", "Failed to upload image to Cloudinary");
        return null;
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
      return null;
    }
  }

  Future<void> saveUserData() async {
    try {
      isUploading.value = true;
      String finalImageUrl = imageUrl.value;

      if (finalImageUrl.isNotEmpty && !finalImageUrl.startsWith('http')) {
        final uploadedUrl = await uploadImageToCloudinary(finalImageUrl);
        if (uploadedUrl != null) {
          finalImageUrl = uploadedUrl;
          imageUrl.value = finalImageUrl;
        } else {
          Get.snackbar("Error", "Failed to upload image ");
          return;
        }
      }

      UserModel user = UserModel(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        dateOfBirth: dateOfBirthController.text.trim(),
        gender: selectedGender.value,
        imageUrl: finalImageUrl,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc('dummyUser')
          .set(user.toMap());

      Get.snackbar('Success', 'Successfully completed');
    } catch (e) {
      Get.snackbar('Error', 'Failed to save: ${e.toString()}');
    } finally {
      isUploading.value = false;
    }
  }

  Future<void> loadUserDataFromFirestore() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('dummyUser')
          .get();

      if (snapshot.exists) {
        final data = snapshot.data()!;
        fullNameController.text = data['fullName'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneNumberController.text = data['phoneNumber'] ?? '';
        dateOfBirthController.text = data['dateOfBirth'] ?? '';
        selectedGender.value = data['gender'] ?? 'Male';
        imageUrl.value = data['imageUrl'] ?? '';
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load data: ${e.toString()}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUserDataFromFirestore();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dateOfBirthController.dispose();
    super.onClose();
  }
}
