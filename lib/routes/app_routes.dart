import 'package:flutter_task_idea/modules/profile/bindings/my_profile.dart';
import 'package:flutter_task_idea/modules/profile/views/myprofile_screen.dart';
import 'package:flutter_task_idea/modules/profile/views/orders_screen.dart';
import 'package:get/get.dart';
import '../modules/profile/views/edit_profile_screen.dart';

import '../modules/profile/bindings/edit_profile_binding.dart';
import '../modules/profile/bindings/order_binding.dart';

class AppRoutes {
  static const EDIT_PROFILE = '/edit-profile';
  static const MY_ORDERS = '/my-orders';

  static var MY_PROFILE = '/my-profile';
}

final List<GetPage> appPages = [
  GetPage(
    name: AppRoutes.EDIT_PROFILE,
    page: () => EditProfileScreen(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.MY_ORDERS,
    page: () => MyOrdersScreen(),
    binding: OrdersBinding(),
  ),
  GetPage(
    name: AppRoutes.MY_PROFILE,
    page: () => MyProfileScreen(),
    binding: MyProfileBinding(),
  ),
];
