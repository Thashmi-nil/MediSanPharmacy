import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/order_model.dart';
import 'customer_order_details_page_bloc.dart';
import 'customer_order_details_page_view.dart';

class CustomerOrderDetailsPageProvider
    extends BlocProvider<CustomerOrderDetailsPageBloc> {
  final OrderModel ordermodel;
  final String role;
  CustomerOrderDetailsPageProvider(
      {required this.ordermodel, this.role = 'customer', Key? key})
      : super(
          key: key,
          create: (context) => CustomerOrderDetailsPageBloc(context),
          child: CustomerOrderDetailsPageView(
            role: role,
            ordermodel: ordermodel,
          ),
        );
}
