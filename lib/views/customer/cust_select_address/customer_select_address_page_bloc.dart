import 'dart:developer';
import 'package:medisan/models/address_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customer_select_address_page_event.dart';
import 'customer_select_address_page_state.dart';

class CustomerSelectAddressPageBloc extends Bloc<CustomerSelectAddressPageEvent,
    CustomerSelectAddressPageState> {
  CustomerSelectAddressPageBloc(BuildContext context)
      : super(CustomerSelectAddressPageState.initialState) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<InitEvent>((event, emit) async {
      try {
        List<AddressModel> addresses = [];
        emit(state.clone(isLoading: true));
        var data = await FirebaseFirestore.instance.collection("address").get();
        for (int i = 0; i < data.docs.length; i++) {
          if (data.docs[i].data()['userID'] == auth.currentUser!.uid) {
            AddressModel model = AddressModel(
              userId: data.docs[i].data()['userID'],
              addressId: data.docs[i].id,
              name: data.docs[i].data()['name'],
              addressLineOne: data.docs[i].data()['addressLineOne'],
              phone: data.docs[i].data()['phone'],
              city: data.docs[i].data()['city'],
              postalCode: data.docs[i].data()['postalCode'],
            );
            addresses.add(model);
          }
        }
        log(addresses.toString());
        emit(state.clone(address: addresses, isLoading: false));
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
  }
}
