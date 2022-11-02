import 'package:flutter/foundation.dart';

@immutable
class AdminProfilePageState {
  final String error;

  const AdminProfilePageState({
    required this.error,
  });

  static AdminProfilePageState get initialState {
    return const AdminProfilePageState(error: '');
  }

  AdminProfilePageState clone({
    String? error,
  }) {
    return AdminProfilePageState(
      error: error ?? this.error,
    );
  }
}
