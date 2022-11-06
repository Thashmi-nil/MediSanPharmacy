import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'cust_order_details_event.dart';
import 'cust_order_details_state.dart';
import 'package:http/http.dart' as http;

class CustomerOrderDetailsPageBloc
    extends Bloc<CustomerOrderDetailsPageEvent, CustomerOrderDetailsPageState> {
  CustomerOrderDetailsPageBloc(BuildContext context)
      : super(CustomerOrderDetailsPageState.initialState);
}
