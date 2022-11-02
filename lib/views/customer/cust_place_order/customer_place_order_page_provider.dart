import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_place_order_page_bloc.dart';
import 'customer_place_order_page_view.dart';

class CustomerPlaceOrderPageProvider
    extends BlocProvider<CustomerPlaceOrderPageBloc> {
  CustomerPlaceOrderPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerPlaceOrderPageBloc(context),
          child: const CustomerPlaceOrderPageView(),
        );
}
