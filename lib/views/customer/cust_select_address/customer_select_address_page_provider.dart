import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_select_address_page_bloc.dart';
import 'customer_select_address_page_view.dart';

class CustomerSelectAddressPageProvider
    extends BlocProvider<CustomerSelectAddressPageBloc> {
  CustomerSelectAddressPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerSelectAddressPageBloc(context),
          child: const CustomerSelectAddressPageView(),
        );
}
