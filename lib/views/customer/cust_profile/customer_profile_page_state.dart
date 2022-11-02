import 'package:flutter/foundation.dart';

@immutable
class CustomerProfilePageState {
  final String email;
  final bool isLoading;

  const CustomerProfilePageState({
    required this.email,
    required this.isLoading,
  });

  static CustomerProfilePageState get initialState {
    return const CustomerProfilePageState(email: '', isLoading: false);
  }

  CustomerProfilePageState clone({
    String? email,
    bool? isLoading,
  }) {
    return CustomerProfilePageState(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
