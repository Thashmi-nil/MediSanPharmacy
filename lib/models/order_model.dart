import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.mainOrderID,
    required this.addressLineCity,
    required this.name,
    required this.phoneNumber,
    required this.customerId,
    required this.address,
    required this.date,
    required this.total,
    required this.orderId,
    required this.products,
  });
  String addressLineCity;
  String name;
  String mainOrderID;
  String phoneNumber;
  String customerId;
  String address;
  String date;
  String total;
  String orderId;
  List<dynamic> products;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        addressLineCity: json["addressLineCity"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        mainOrderID: json["mainOrderID"],
        customerId: json["customerID"],
        address: json["address"],
        date: json["date"],
        total: json["total"],
        orderId: json["orderID"],
        products: List<dynamic>.from(json["products"].map((x) => x)),
      );
  Map<String, dynamic> toJson() => {
        "addressLineCity": addressLineCity,
        "name": name,
        "phoneNumber": phoneNumber,
        "mainOrderID": mainOrderID,
        "customerID": customerId,
        "address": address,
        "date": date,
        "total": total,
        "orderID": orderId,
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}
