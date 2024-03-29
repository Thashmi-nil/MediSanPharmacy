// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'cust_place_order_event.dart';
import 'cust_place_order_state.dart';

class CustomerPlaceOrderPageBloc
    extends Bloc<CustomerPlaceOrderPageEvent, CustomerPlaceOrderPageState> {
  CustomerPlaceOrderPageBloc(BuildContext context)
      : super(CustomerPlaceOrderPageState.initialState) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var uuid = const Uuid();
    on<LastAddAddressEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      log(event.addressModel.toString());
      emit(state.clone(isLoading: false, addressModel: event.addressModel));
    });
    on<LastAddProductsEvent>((event, emit) {
      log(event.shoppingCart.toString());
      emit(state.clone(isLoading: true));
      emit(state.clone(isLoading: false, shoppingCart: event.shoppingCart));
    });

    on<PlaceOrderEvent>((event, emit) async {
      emit(state.clone(isLoading: true, addName: 'registering'));
      double total = 0;

      // CALCULATE THE TOTAL PRICE
      for (var item in state.shoppingCart) {
        total += item['product'].productPrice * item['count'];
      }
      log(total.toString());

      // MY ORDER OBJECT
      var myOrder = {
        "customerName": auth.currentUser!.email,
        "customerID": auth.currentUser!.uid,
        "date": DateTime.now().toString(),
        "total": total.toString(),
        "orderID": uuid.v4(),
        "address": state.addressModel,
        "products": state.shoppingCart
      };
      log(myOrder.toString());

      // ADD THE ORDER TO THE REALTIME DATABASE
      try {
        const url =
            'https://pharmacyapp-50403-default-rtdb.firebaseio.com/order.json';
        await http.post(Uri.parse(url), body: json.encode(myOrder));
        emit(state.clone(isLoading: false, addName: 'registered'));
      } catch (e) {
        emit(state.clone(isLoading: false));
        return Future.error(e.toString());
      }
    });
    on<InitEvent>((event, emit) {
      emit(state.clone(isLoading: false, addName: 'registering'));
    });
  }
}
