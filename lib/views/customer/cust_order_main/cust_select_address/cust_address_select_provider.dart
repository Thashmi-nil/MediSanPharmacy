import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_address_select_bloc.dart';
import 'cust_address_select.dart';

class CustomerSelectAddressPageProvider
    extends BlocProvider<CustomerSelectAddressPageBloc> {
  CustomerSelectAddressPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerSelectAddressPageBloc(context),
          child: const CustomerSelectAddressPageView(),
        );
}
