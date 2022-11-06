import 'package:flutter/foundation.dart';

@immutable
class CustomerProductDetailsPageState {
  final String error;

  const CustomerProductDetailsPageState({
    required this.error,
  });

  static CustomerProductDetailsPageState get initialState {
    return const CustomerProductDetailsPageState(error: '');
  }

  CustomerProductDetailsPageState clone({
    String? error,
  }) {
    return CustomerProductDetailsPageState(
      error: error ?? this.error,
    );
  }
}
