import 'package:flutter/foundation.dart';

@immutable
class CustomerOrderDetailsPageState {
  final String error;

  const CustomerOrderDetailsPageState({
    required this.error,
  });

  static CustomerOrderDetailsPageState get initialState {
    return const CustomerOrderDetailsPageState(error: '');
  }

  CustomerOrderDetailsPageState clone({
    String? error,
  }) {
    return CustomerOrderDetailsPageState(
      error: error ?? this.error,
    );
  }
}
