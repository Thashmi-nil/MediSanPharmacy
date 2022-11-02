import 'package:flutter/foundation.dart';

@immutable
class AddProductPageState {
  final String error;
  final bool isLoading;
  final String imageUrl;

  const AddProductPageState({
    required this.error,
    required this.imageUrl,
    required this.isLoading,
  });

  static AddProductPageState get initialState {
    return const AddProductPageState(error: '', isLoading: false, imageUrl: '');
  }

  AddProductPageState clone({
    String? error,
    bool? isLoading,
    String? imageUrl,
  }) {
    return AddProductPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
