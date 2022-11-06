import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.docID,
    required this.userId,
    required this.imageUrl,
    required this.productId,
    required this.name,
    required this.productPrice,
    required this.productQuantity,
    required this.productType,
    required this.aboutProduct,
  });
  String docID;
  String userId;
  String name;
  String productType;
  double productPrice;
  double productQuantity;
  String imageUrl;
  String aboutProduct;
  String productId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        docID: json["docID"],
        userId: json["userID"],
        productId: json["productID"],
        name: json["name"],
        productPrice: json["productPrice"].toDouble(),
        productQuantity: json["productQuantity"],
        productType: json["productType"],
        imageUrl: json["imageUrl"],
        aboutProduct: json["aboutProduct"],
      );

  Map<String, dynamic> toJson() => {
        "docID": docID,
        "userID": userId,
        "productID": productId,
        "name": name,
        "productPrice": productPrice,
        "productQuantity": productQuantity,
        "productType": productType,
        "imageUrl": imageUrl,
        "aboutProduct": aboutProduct,
      };
}
