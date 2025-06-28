import 'package:flutter/material.dart';
import 'package:flutter_task_idea/core/constants/app_colors.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final VoidCallback onTap;

  const ProfileListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor = AppColors.white,
    this.backgroundColor = AppColors.salmon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: title == "Logout" ? Colors.black : null),
      ),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor,
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: iconColor),
        ),
      ),
      onTap: onTap,
    );
  }
}
