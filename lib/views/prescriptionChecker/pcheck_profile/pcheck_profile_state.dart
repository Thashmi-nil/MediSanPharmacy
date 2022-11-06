import 'package:flutter/foundation.dart';

@immutable
class PCheckerProfilePageState {
  final String email;
  final bool isLoading;

  const PCheckerProfilePageState({
    required this.email,
    required this.isLoading,
  });

  static PCheckerProfilePageState get initialState {
    return const PCheckerProfilePageState(email: '', isLoading: false);
  }

  PCheckerProfilePageState clone({
    String? email,
    bool? isLoading,
  }) {
    return PCheckerProfilePageState(
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
