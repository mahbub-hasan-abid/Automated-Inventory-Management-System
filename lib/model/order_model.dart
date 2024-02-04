class OrderModel {
  String id = '';
  String customerId = '';
  String customerName = '';
  String productId = '';
  String productName = ''; // Added product_name
  String quantity = '0';
  String price = '0';
  String totalAmount = '0';

  OrderModel({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.productId,
    required this.productName, // Added for product_name
    required this.quantity,
    required this.price,
    required this.totalAmount,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String, // Added for product_name
      quantity: json['quantity'] as String,
      price: json['price'] as String,
      totalAmount: json['total'] as String,
    );
  }
}
