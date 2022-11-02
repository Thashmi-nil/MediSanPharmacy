part of 'get_category_bloc.dart';

class GetCategoryState {
  final String category;
  const GetCategoryState({required this.category});
  static GetCategoryState get initialState =>
      const GetCategoryState(category: '');
  GetCategoryState clone({
    String? category,
  }) {
    return GetCategoryState(category: category ?? this.category);
  }
}
