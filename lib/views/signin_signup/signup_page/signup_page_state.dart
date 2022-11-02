import 'package:flutter/foundation.dart';

@immutable
class SignupPageState {
  final String error;
  final bool isLoading;

  const SignupPageState({
    required this.error,
    required this.isLoading,
  });

  static SignupPageState get initialState {
    return const SignupPageState(error: '', isLoading: false);
  }

  SignupPageState clone({
    String? error,
    bool? isLoading,
  }) {
    return SignupPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
