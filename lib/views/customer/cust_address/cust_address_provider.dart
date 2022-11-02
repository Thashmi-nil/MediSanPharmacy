import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cus_address_bloc.dart';
import 'cus_address.dart';

class CustomerAddAddressPageProvider
    extends BlocProvider<CustomerAddAddressPageBloc> {
  CustomerAddAddressPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerAddAddressPageBloc(context),
          child: const CustomerAddAddressPageView(),
        );
}
