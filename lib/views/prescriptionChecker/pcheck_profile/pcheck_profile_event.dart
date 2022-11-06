import 'package:flutter/foundation.dart';

@immutable
abstract class PCheckerProfilePageEvent {}

class AddFeedBackEvent extends PCheckerProfilePageEvent {
  final String feedback;
  AddFeedBackEvent({required this.feedback});
}

class InitEvent extends PCheckerProfilePageEvent {}
