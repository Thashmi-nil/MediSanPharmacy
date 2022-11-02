import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.mainID,
    required this.city,
    required this.name,
    required this.phone,
    required this.customerId,
    required this.address,
    required this.date,
    required this.total,
    required this.orderId,
    required this.products,
  });
  String city;
  String name;
  String mainID;
  String phone;
  String customerId;
  String address;
  String date;
  String total;
  String orderId;
  List<dynamic> products;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        city: json["city"],
        name: json["name"],
        phone: json["phone"],
        mainID: json["mainID"],
        customerId: json["customerID"],
        address: json["address"],
        date: json["date"],
        total: json["total"],
        orderId: json["orderID"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
      );
  Map<String, dynamic> toJson() => {
        "city": city,
        "name": name,
        "phone": phone,
        "mainID": mainID,
        "customerID": customerId,
        "address": address,
        "date": date,
        "total": total,
        "orderID": orderId,
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}
