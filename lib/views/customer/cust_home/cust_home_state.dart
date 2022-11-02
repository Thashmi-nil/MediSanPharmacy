import 'package:flutter/foundation.dart';

@immutable
class CustomerHomePageState {
  final String error;

  const CustomerHomePageState({
    required this.error,
  });

  static CustomerHomePageState get initialState {
    return const CustomerHomePageState(error: '');
  }

  CustomerHomePageState clone({
    String? error,
  }) {
    return CustomerHomePageState(
      error: error ?? this.error,
    );
  }
}
