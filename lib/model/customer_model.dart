class CustomerModel {
  String id;
  String customerName;
  String phone;
  String address;

  CustomerModel({
    required this.id,
    required this.customerName,
    required this.phone,
    required this.address,
  });

  // Factory constructor for creating a CustomerModel from JSON
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerName: json['name'] as String,
      id: json['id'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
    );
  }
}
