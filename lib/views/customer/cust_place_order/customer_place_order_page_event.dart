import 'package:medisan/models/address_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerPlaceOrderPageEvent {}

class LastAddAddressEvent extends CustomerPlaceOrderPageEvent {
  final AddressModel addressModel;
  LastAddAddressEvent({required this.addressModel});
}

class LastAddProductsEvent extends CustomerPlaceOrderPageEvent {
  var shoppingCart;
  LastAddProductsEvent({required this.shoppingCart});
}

class PlaceOrderEvent extends CustomerPlaceOrderPageEvent {}

class InitEvent extends CustomerPlaceOrderPageEvent {}
