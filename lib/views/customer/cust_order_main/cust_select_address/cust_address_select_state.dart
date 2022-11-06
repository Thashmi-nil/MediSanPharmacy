import 'package:medisan/models/address_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class CustomerSelectAddressPageState {
  final String error;
  final bool isLoading;
  final List<AddressModel> address;

  const CustomerSelectAddressPageState({
    required this.error,
    required this.address,
    required this.isLoading,
  });

  static CustomerSelectAddressPageState get initialState {
    return const CustomerSelectAddressPageState(
      error: '',
      isLoading: false,
      address: [],
    );
  }

  CustomerSelectAddressPageState clone({
    String? error,
    bool? isLoading,
    List<AddressModel>? address,
  }) {
    return CustomerSelectAddressPageState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      address: address ?? this.address,
    );
  }
}
