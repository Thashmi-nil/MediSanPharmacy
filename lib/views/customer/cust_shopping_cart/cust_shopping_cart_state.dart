import 'package:flutter/foundation.dart';

@immutable
class ShoppingCartPageState {
  final String error;
  final int cartItem;
  final bool isLoading;
  final List selectItem;

  const ShoppingCartPageState({
    required this.error,
    required this.cartItem,
    required this.isLoading,
    required this.selectItem,
  });

  static ShoppingCartPageState get initialState {
    return const ShoppingCartPageState(
      error: '',
      cartItem: 0,
      isLoading: false,
      selectItem: [],
    );
  }

  ShoppingCartPageState clone({
    String? error,
    int? cartItem,
    bool? isLoading,
    List? selectItem,
  }) {
    return ShoppingCartPageState(
      error: error ?? this.error,
      cartItem: cartItem ?? this.cartItem,
      isLoading: isLoading ?? this.isLoading,
      selectItem: selectItem ?? this.selectItem,
    );
  }
}
