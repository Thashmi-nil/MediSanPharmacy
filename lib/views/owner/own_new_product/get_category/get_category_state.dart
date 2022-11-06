part of 'get_category_bloc.dart';

class GetCategoryState {
  final String productType;
  const GetCategoryState({required this.productType});
  static GetCategoryState get initialState =>
      const GetCategoryState(productType: '');
  GetCategoryState clone({
    String? productType,
  }) {
    return GetCategoryState(productType: productType ?? this.productType);
  }
}
