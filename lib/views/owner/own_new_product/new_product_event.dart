import 'package:flutter/foundation.dart';

@immutable
abstract class AddProductPageEvent {}

class AddNewProductEvent extends AddProductPageEvent {
  final String name;
  final double price;
  final double quantity;
  final String category;
  final String description;
  final String imageUrl;

  AddNewProductEvent({
    required this.category,
    required this.description,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class UploadImageEvent extends AddProductPageEvent {}
