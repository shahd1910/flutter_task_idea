import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_listwiew.dart';
import '../controllers/order_controller.dart';

class MyOrdersScreen extends StatelessWidget {
  final controller = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: AppColors.salmon,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.orders.isEmpty) {
          return const Center(child: Text("No Orders Found"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.orders.length,
          itemBuilder: (context, index) {
            final order = controller.orders[index];
            return OrderItem(
              imageUrl: order.imageUrl,
              productName: order.name,
              description: order.description,
              status: order.status,
              date: order.date,
              price: order.price.toString(),
              quantity: "${order.quantity}x",
              total: "\$${order.total}",
            );
          },
        );
      }),
    );
  }
}
