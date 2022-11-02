import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'customer_product_details_page_event.dart';
import 'customer_product_details_page_state.dart';

class CustomerProductDetailsPageBloc extends Bloc<
    CustomerProductDetailsPageEvent, CustomerProductDetailsPageState> {
  CustomerProductDetailsPageBloc(BuildContext context)
      : super(CustomerProductDetailsPageState.initialState);
}
