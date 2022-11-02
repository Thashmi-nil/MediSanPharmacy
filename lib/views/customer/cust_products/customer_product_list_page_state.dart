import 'package:medisan/models/product_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class CustomerProductListPageState {
  final String error;
  final bool isLoading;
  final List<ProductModel> products;
  final List<ProductModel> cart;
  final List<ProductModel> colorCosmetics;
  final List<ProductModel> fragrance;
  final List<ProductModel> skinCare;
  final List<ProductModel> hairCare;
  final int cartItems;
  final int itemCount;

  const CustomerProductListPageState({
    required this.error,
    required this.colorCosmetics,
    required this.fragrance,
    required this.hairCare,
    required this.isLoading,
    required this.products,
    required this.skinCare,
    required this.cart,
    required this.cartItems,
    required this.itemCount,
  });

  static CustomerProductListPageState get initialState {
    return const CustomerProductListPageState(
      error: '',
      colorCosmetics: [],
      fragrance: [],
      hairCare: [],
      isLoading: false,
      products: [],
      skinCare: [],
      cart: [],
      cartItems: 0,
      itemCount: 1,
    );
  }

  CustomerProductListPageState clone({
    String? error,
    bool? isLoading,
    List<ProductModel>? products,
    List<ProductModel>? colorCosmetics,
    List<ProductModel>? fragrance,
    List<ProductModel>? skinCare,
    List<ProductModel>? hairCare,
    List<ProductModel>? cart,
    int? cartItems,
    int? itemCount,
  }) {
    return CustomerProductListPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      colorCosmetics: colorCosmetics ?? this.colorCosmetics,
      fragrance: fragrance ?? this.fragrance,
      skinCare: skinCare ?? this.skinCare,
      hairCare: hairCare ?? this.hairCare,
      cart: cart ?? this.cart,
      cartItems: cartItems ?? this.cartItems,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
