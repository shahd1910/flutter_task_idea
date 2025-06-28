import 'package:flutter/material.dart';
import 'package:flutter_task_idea/core/widgets/custom_listtitle.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/profile_controller.dart';

class MyProfileScreen extends StatelessWidget {
  final controller = Get.find<MyProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: AppColors.salmon,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.salmon),
            onPressed: () => Get.toNamed('/edit-profile'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final user = controller.user.value;

          return Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: user.imageUrl.isNotEmpty
                    ? NetworkImage(user.imageUrl)
                    : null,
                child: user.imageUrl.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              Text(
                user.fullName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text("ID: 25030024"),

              const SizedBox(height: 32),
              Container(
                color: AppColors.salmon,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed('/edit-profile');
                          },
                          icon: Icon(Icons.person, size: 40),
                        ),
                        SizedBox(height: 4),
                        Text('Profile', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite, size: 40),
                        ),
                        SizedBox(height: 4),
                        Text('Wishlist', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed('/my-orders');
                          },
                          icon: Icon(Icons.recent_actors, size: 40),
                        ),
                        SizedBox(height: 4),
                        Text('My Orders', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Divider(),
              ProfileListTile(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              ProfileListTile(
                icon: Icons.payment,
                title: 'Payment Methods',
                onTap: () {},
              ),
              ProfileListTile(
                icon: Icons.notifications_none,
                title: 'Notification',
                onTap: () {},
              ),
              ProfileListTile(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              ProfileListTile(
                icon: Icons.help_outline,
                title: 'Help',
                onTap: () {},
              ),
              ProfileListTile(
                icon: Icons.logout,
                title: 'Logout',
                iconColor: AppColors.terracotta,
                backgroundColor: AppColors.beige,

                onTap: () => controller.logout(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
