import 'package:flutter/foundation.dart';

@immutable
abstract class AllItemSearchPageEvent {}

class InitEvent extends AllItemSearchPageEvent {}

class SearchItemNameEvent extends AllItemSearchPageEvent {
  final String title;
  SearchItemNameEvent({required this.title});
}

class ClearEvent extends AllItemSearchPageEvent {}
