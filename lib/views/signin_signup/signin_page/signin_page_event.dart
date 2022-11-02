import 'package:flutter/foundation.dart';

@immutable
abstract class SignINPageEvent {}

class UserLoginEvent extends SignINPageEvent {
  final String email;
  final String password;

  UserLoginEvent({required this.email, required this.password});
}
