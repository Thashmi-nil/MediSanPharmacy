import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_place_order_bloc.dart';
import 'cust_place_order.dart';

class CustomerPlaceOrderPageProvider
    extends BlocProvider<CustomerPlaceOrderPageBloc> {
  CustomerPlaceOrderPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerPlaceOrderPageBloc(context),
          child: const CustomerPlaceOrderPageView(),
        );
}
