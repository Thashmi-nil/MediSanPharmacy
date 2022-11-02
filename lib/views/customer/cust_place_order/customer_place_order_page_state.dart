import 'package:medisan/models/address_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class CustomerPlaceOrderPageState {
  final String error;
  final String prodName;
  final String addName;
  final AddressModel? addressModel;
  final bool isLoading;
  final List shoppingCart;

  const CustomerPlaceOrderPageState({
    required this.error,
    required this.prodName,
    required this.addName,
    this.addressModel,
    required this.isLoading,
    required this.shoppingCart,
  });

  static CustomerPlaceOrderPageState get initialState {
    return const CustomerPlaceOrderPageState(
      error: '',
      prodName: '',
      addName: 'registering',
      isLoading: false,
      shoppingCart: [],
    );
  }

  CustomerPlaceOrderPageState clone({
    String? error,
    String? prodName,
    String? addName,
    AddressModel? addressModel,
    bool? isLoading,
    List? shoppingCart,
  }) {
    return CustomerPlaceOrderPageState(
      error: error ?? this.error,
      prodName: prodName ?? this.prodName,
      addName: addName ?? this.addName,
      addressModel: addressModel ?? this.addressModel,
      isLoading: isLoading ?? this.isLoading,
      shoppingCart: shoppingCart ?? this.shoppingCart,
    );
  }
}
