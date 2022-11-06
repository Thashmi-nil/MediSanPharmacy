import 'package:flutter/foundation.dart';

@immutable
abstract class AddProductPageEvent {}

class AddNewProductEvent extends AddProductPageEvent {
  final String name;
  final double productPrice;
  final double productQuantity;
  final String productType;
  final String aboutProduct;
  final String imageUrl;

  AddNewProductEvent({
    required this.productType,
    required this.aboutProduct,
    required this.name,
    required this.productPrice,
    required this.productQuantity,
    required this.imageUrl,
  });
}

class UploadImageEvent extends AddProductPageEvent {}
