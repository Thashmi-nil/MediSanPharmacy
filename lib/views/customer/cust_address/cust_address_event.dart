// FIRE A EVENT TO ADD ADDRESS TO FIREBASE

import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerAddAddressPageEvent {}

class AddAddressEvent extends CustomerAddAddressPageEvent {
  final String name;
  final String addressLineOne;
  final String addressLineCity;
  final String phoneNumber;

  AddAddressEvent({
    required this.addressLineOne,
    required this.addressLineCity,
    required this.name,
    required this.phoneNumber,
  });
}
