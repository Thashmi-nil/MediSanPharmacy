import 'package:flutter/foundation.dart';

@immutable
class SignINPageState {
  final String error;
  final bool isLoading;

  const SignINPageState({
    required this.error,
    required this.isLoading,
  });

  static SignINPageState get initialState {
    return const SignINPageState(error: '', isLoading: false);
  }

  SignINPageState clone({
    String? error,
    bool? isLoading,
  }) {
    return SignINPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
