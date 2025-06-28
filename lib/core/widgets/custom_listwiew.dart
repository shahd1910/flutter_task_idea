import 'package:flutter/material.dart';
import 'package:flutter_task_idea/core/constants/app_colors.dart';

class OrderItem extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String description;
  final String status;
  final String date;
  final String price;
  final String quantity;
  final String total;

  const OrderItem({
    required this.imageUrl,
    required this.productName,
    required this.description,
    required this.status,
    required this.date,
    required this.price,
    required this.quantity,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final imageSize = width * 0.20;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order : $status",
                style: const TextStyle(
                 
                  color: AppColors.black,
                  fontSize: 13,
                ),
              ),
              Text(
                date,
                style: const TextStyle(color: AppColors.black, fontSize: 13),
              ),
            ],
          ),
          const Divider(thickness: 1.2, color: AppColors.orangeDark),
          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.salmon,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),

                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.add_circle_outline,
                            color: AppColors.salmon,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 8),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.salmon),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.delete_outline,
                              color: AppColors.salmon,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Text(
                      description,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price: \$$price",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Qty: $quantity",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Total: $total",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
