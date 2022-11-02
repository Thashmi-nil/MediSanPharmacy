import 'package:flutter/foundation.dart';

@immutable
class AdminProductDetailsPageState {
  final String error;

  const AdminProductDetailsPageState({
    required this.error,
  });

  static AdminProductDetailsPageState get initialState {
    return const AdminProductDetailsPageState(error: '');
  }

  AdminProductDetailsPageState clone({
    String? error,
  }) {
    return AdminProductDetailsPageState(
      error: error ?? this.error,
    );
  }
}
