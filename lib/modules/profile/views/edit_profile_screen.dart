import 'package:flutter/material.dart';
import 'package:flutter_task_idea/core/constants/app_colors.dart';
import 'package:flutter_task_idea/core/widgets/custom_button.dart';
import 'package:flutter_task_idea/core/widgets/custom_text_field.dart';
import 'package:flutter_task_idea/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  final controller = Get.find<EditProfileController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: AppColors.salmon),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: AppColors.white,
      
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth;
            double maxHeight = constraints.maxHeight;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Obx(() {
                    final imagePath = controller.imageUrl.value;
                    
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: maxWidth * 0.2,
                          backgroundColor: AppColors.brownRosy.withOpacity(0.2),
                          backgroundImage: imagePath.startsWith('http')
                              ? NetworkImage(imagePath)
                              : null,
                          child: imagePath.isEmpty
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                )
                              : null,
                        ),
                        CircleAvatar(
                          radius: maxWidth * 0.06,
                          backgroundColor: AppColors.salmon,
                          child: IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              try {
                                final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  final uploadedUrl = await controller
                                      .uploadImageToCloudinary(image.path);
                                  if (uploadedUrl != null) {
                                    controller.imageUrl.value = uploadedUrl;
                                    Get.snackbar(
                                      'Success',
                                      'Image uploaded successfulle',
                                    );
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      'Failed to upload image',
                                    );
                                  }
                                }
                              } catch (e) {
                                Get.snackbar('Error', e.toString());
                              }
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                    
                  SizedBox(height: maxHeight * 0.03),
                    
                  Container(
                    width: maxWidth,
                    color: AppColors.beige,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${controller.fullNameController.text}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'ID:',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' 25785952',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: maxHeight * 0.03),
                    
                  // Full Name,
                  const SizedBox(height: 16),
                    
                  // Email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        CustomtextformField(
                          controller: controller.fullNameController,
                          keyboardType: TextInputType.name,
                    
                          fillColor: AppColors.beige,
                          borderRadius: 12,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                    
                        CustomtextformField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                    
                          fillColor: AppColors.beige,
                          borderRadius: 12,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomtextformField(
                          controller: controller.phoneNumberController,
                          keyboardType: TextInputType.phone,
                    
                          fillColor: AppColors.beige,
                          borderRadius: 12,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                        const SizedBox(height: 16),
                    
                        CustomtextformField(
                          controller: controller.dateOfBirthController,
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                    
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1970),
                              lastDate: DateTime(2100),
                            );
                    
                            if (pickedDate != null) {
                              controller.dateOfBirthController.text = pickedDate
                                  .toLocal()
                                  .toString()
                                  .split(' ')[0];
                            }
                          },
                    
                          fillColor: AppColors.beige,
                          borderRadius: 12,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                    
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Obx(() {
                            return Row(
                              children: [
                                // Male
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () =>
                                        controller.selectedGender.value = 'Male',
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            controller.selectedGender.value ==
                                                'Male'
                                            ? AppColors.salmon
                                            : AppColors.brownRosy.withOpacity(
                                                0.2,
                                              ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Male',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  controller
                                                          .selectedGender
                                                          .value ==
                                                      'Male'
                                                  ? AppColors.white
                                                  : AppColors.black,
                                            ),
                                          ),
                                          if (controller.selectedGender.value ==
                                              'Male') ...[
                                            const SizedBox(width: 6),
                                            const Icon(
                                              Icons.check_circle_outlined,
                                              size: 18,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Female
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => controller.selectedGender.value =
                                        'Female',
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            controller.selectedGender.value ==
                                                'Female'
                                            ? AppColors.salmon
                                            : AppColors.brownRosy.withOpacity(
                                                0.2,
                                              ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Female',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  controller
                                                          .selectedGender
                                                          .value ==
                                                      'Female'
                                                  ? AppColors.white
                                                  : AppColors.black,
                                            ),
                                          ),
                                          if (controller.selectedGender.value ==
                                              'Female') ...[
                                            const SizedBox(width: 6),
                                            const Icon(
                                              Icons.check_circle_outlined,
                                              size: 18,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            width: maxWidth * 0.7,
                            child: CustomButton(
                              onpressed: () async {
                                await controller.saveUserData();
                                await Get.find<MyProfileController>()
                                    .fetchUserData();
                                Get.back();
                              },
                    
                              text: 'Update Profile',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
