import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerProfilePageEvent {}

class AddFeedBackEvent extends CustomerProfilePageEvent {
  final String feedback;
  AddFeedBackEvent({required this.feedback});
}

class InitEvent extends CustomerProfilePageEvent {}
