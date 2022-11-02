import 'package:flutter/foundation.dart';

@immutable
abstract class SignupPageEvent {}

class SubmitUserDataEvent extends SignupPageEvent {
  final String name;
  final String email;
  final String password;

  SubmitUserDataEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
