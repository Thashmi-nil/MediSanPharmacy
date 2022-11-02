import 'package:medisan/models/product_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class AdminHomePageState {
  final String error;
  final bool isLoading;
  final List<ProductModel> products;
  final List<ProductModel> colorCosmetics;
  final List<ProductModel> fragrance;
  final List<ProductModel> skinCare;
  final List<ProductModel> hairCare;

  const AdminHomePageState({
    required this.error,
    required this.products,
    required this.isLoading,
    required this.colorCosmetics,
    required this.fragrance,
    required this.hairCare,
    required this.skinCare,
  });

  static AdminHomePageState get initialState {
    return const AdminHomePageState(
        error: '',
        products: [],
        isLoading: false,
        colorCosmetics: [],
        fragrance: [],
        hairCare: [],
        skinCare: []);
  }

  AdminHomePageState clone({
    String? error,
    List<ProductModel>? products,
    bool? isLoading,
    List<ProductModel>? colorCosmetics,
    List<ProductModel>? fragrance,
    List<ProductModel>? hairCare,
    List<ProductModel>? skinCare,
  }) {
    return AdminHomePageState(
      error: error ?? this.error,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      colorCosmetics: colorCosmetics ?? this.colorCosmetics,
      fragrance: fragrance ?? this.fragrance,
      hairCare: hairCare ?? this.hairCare,
      skinCare: skinCare ?? this.skinCare,
    );
  }
}
