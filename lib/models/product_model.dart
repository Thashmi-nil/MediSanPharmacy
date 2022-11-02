import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.documentID,
    required this.userId,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
    required this.imageUrl,
    required this.description,
  });
  String documentID;
  String userId;
  String productId;
  String name;
  double price;
  double quantity;
  String category;
  String imageUrl;
  String description;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        documentID: json["documentID"],
        userId: json["userID"],
        productId: json["productID"],
        name: json["name"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
        category: json["category"],
        imageUrl: json["imageUrl"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "documentID": documentID,
        "userID": userId,
        "productID": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "category": category,
        "imageUrl": imageUrl,
        "description": description,
      };
}
