// WORKED FOR GETTING THE USER ENTERED VALUES

import 'package:flutter/foundation.dart';

@immutable
class CustomerAddAddressPageState {
  final String error;
  final bool isLoading;

  const CustomerAddAddressPageState({
    required this.error,
    required this.isLoading,
  });

  static CustomerAddAddressPageState get initialState {
    return const CustomerAddAddressPageState(error: '', isLoading: false);
  }

  CustomerAddAddressPageState clone({
    String? error,
    bool? isLoading,
  }) {
    return CustomerAddAddressPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
