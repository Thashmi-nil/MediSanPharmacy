import 'package:flutter/foundation.dart';

@immutable
abstract class CustomerAddAddressPageEvent {}

class AddAddressEvent extends CustomerAddAddressPageEvent {
  final String name;
  final String addressLineOne;
  final String city;
  final String postalCode;
  final String phone;

  AddAddressEvent({
    required this.addressLineOne,
    required this.city,
    required this.name,
    required this.phone,
    required this.postalCode,
  });
}
