import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/order_model.dart';
import 'customer_order_page_bloc.dart';
import 'customer_order_page_view.dart';

class CustomerOrderPageProvider extends BlocProvider<CustomerOrderPageBloc> {
  final String mode;
  final String role;

  CustomerOrderPageProvider(
      {this.mode = 'Tabbar', required this.role, Key? key})
      : super(
          key: key,
          create: (context) => CustomerOrderPageBloc(context),
          child: CustomerOrderPageView(
            mode: mode,
            role: role,
          ),
        );
}
