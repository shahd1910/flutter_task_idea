import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
  }
}
