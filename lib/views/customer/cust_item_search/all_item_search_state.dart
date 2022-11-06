// WORKED FOR SERACHING USER ENTERED ITEMS

import 'package:medisan/models/product_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class AllItemSearchPageState {
  final String error;
  final List<ProductModel> products;
  final List<ProductModel> skinCare;
  final List<ProductModel> hairCare;
  final List<ProductModel> fragrance;
  final List<ProductModel> colorCosmetics;
  final List<ProductModel> searchProducts;
  final bool isLoading;

  const AllItemSearchPageState({
    required this.error,
    required this.products,
    required this.searchProducts,
    required this.isLoading,
    required this.skinCare,
    required this.hairCare,
    required this.fragrance,
    required this.colorCosmetics,
  });

  static AllItemSearchPageState get initialState {
    return const AllItemSearchPageState(
      error: '',
      products: [],
      isLoading: false,
      searchProducts: [],
      skinCare: [],
      hairCare: [],
      fragrance: [],
      colorCosmetics: [],
    );
  }

  AllItemSearchPageState clone({
    String? error,
    List<ProductModel>? products,
    List<ProductModel>? searchProducts,
    bool? isLoading,
    List<ProductModel>? skinCare,
    List<ProductModel>? hairCare,
    List<ProductModel>? fragrance,
    List<ProductModel>? colorCosmetics,
  }) {
    return AllItemSearchPageState(
      error: error ?? this.error,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      searchProducts: searchProducts ?? this.searchProducts,
      skinCare: skinCare ?? this.skinCare,
      fragrance: fragrance ?? this.fragrance,
      hairCare: hairCare ?? this.hairCare,
      colorCosmetics: colorCosmetics ?? this.colorCosmetics,
    );
  }
}
