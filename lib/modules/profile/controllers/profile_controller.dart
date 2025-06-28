import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_task_idea/data/models/profile_model.dart';

class MyProfileController extends GetxController {
  var user = ProfileModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('dummyUser')
          .get();

      if (snapshot.exists) {
        user.value = ProfileModel.fromMap(snapshot.data()!);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data: ${e.toString()}");
    }
  }

  void logout() {
    Get.snackbar("Logout", "Successfully logged out");
  }
}
