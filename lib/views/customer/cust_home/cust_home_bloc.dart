import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'cust_home_event.dart';
import 'cust_home_state.dart';

class CustomerHomePageBloc
    extends Bloc<CustomerHomePageEvent, CustomerHomePageState> {
  CustomerHomePageBloc(BuildContext context)
      : super(CustomerHomePageState.initialState);
}
