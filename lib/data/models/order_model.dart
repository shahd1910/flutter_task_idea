class OrderModel {
  final String name;
  final String description;
  final String imageUrl;
  final String status;
  final String date;
  final double price;
  final int quantity;
  final int total;

  OrderModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.status,
    required this.date,
    required this.price,
    required this.quantity,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'status': status,
      'date': date,
      'price': price,
      'quantity': quantity,
      "total": total,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      status: map['status'] ?? "",
      date: map['date'] ?? "",
      price: (map['price'] ?? 0).toDouble(),
      quantity: map['quantity'] ?? 0,
      total: map["total"] ?? 0,
    );
  }
}
