import 'package:flutter/foundation.dart';

@immutable
abstract class ShoppingCartPageEvent {}

class AddToCartEvent extends ShoppingCartPageEvent {
  var cartItems;
  AddToCartEvent({required this.cartItems});
}

class ClearCartEvent extends ShoppingCartPageEvent {}
