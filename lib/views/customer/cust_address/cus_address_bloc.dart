// METHOD OF ADDING ADDRESS TO THE FIRESTORE DATABASE

import 'package:medisan/views/customer/cust_order_main/cust_select_address/cust_address_select_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'cust_address_event.dart';
import 'cust_address_state.dart';

class CustomerAddAddressPageBloc
    extends Bloc<CustomerAddAddressPageEvent, CustomerAddAddressPageState> {
  late TextEditingController nameTextEditingController =
      TextEditingController();
  late TextEditingController addressLineOneTextEditingController =
      TextEditingController();
  late TextEditingController cityTextEditingController =
      TextEditingController();
  late TextEditingController phoneTextEditingController =
      TextEditingController();
  CustomerAddAddressPageBloc(BuildContext context)
      : super(CustomerAddAddressPageState.initialState) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var uuid = const Uuid();
    on<AddAddressEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        await firestore.collection('address').doc(uuid.v4()).set({
          "userID": auth.currentUser!.uid,
          "addressID": uuid.v4(),
          "name": event.name,
          "addressLineOne": event.addressLineOne,
          "addressLineCity": event.addressLineCity,
          "phoneNumber": event.phoneNumber,
        });
        emit(state.clone(isLoading: false));
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => CustomerSelectAddressPageProvider()),
          ),
        );
      } catch (e) {
        emit(state.clone(isLoading: false));
        return Future.error(e.toString());
      }
    });
  }
}
