import 'package:flutter/foundation.dart';

@immutable
class PCheckerHomePageState {
  final String error;

  const PCheckerHomePageState({
    required this.error,
  });

  static PCheckerHomePageState get initialState {
    return const PCheckerHomePageState(error: '');
  }

  PCheckerHomePageState clone({
    String? error,
  }) {
    return PCheckerHomePageState(
      error: error ?? this.error,
    );
  }
}
