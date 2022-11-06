import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'cust_product_details_event.dart';
import 'cust_product_details_state.dart';

class CustomerProductDetailsPageBloc extends Bloc<
    CustomerProductDetailsPageEvent, CustomerProductDetailsPageState> {
  CustomerProductDetailsPageBloc(BuildContext context)
      : super(CustomerProductDetailsPageState.initialState);
}
