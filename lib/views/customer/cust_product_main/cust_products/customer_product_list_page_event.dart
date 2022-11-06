import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerProductListPageEvent {}

class InitEvent extends CustomerProductListPageEvent {}

class cartEvent extends CustomerProductListPageEvent {
  var cartProduct;
  cartEvent({required this.cartProduct});
}

class AddItemCountEvent extends CustomerProductListPageEvent {
  final int itemCount;
  AddItemCountEvent({required this.itemCount});
}

class ClearMainCartEvent extends CustomerProductListPageEvent {}
