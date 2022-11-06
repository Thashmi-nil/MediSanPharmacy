import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_profile_bloc.dart';
import 'cust_profile.dart';

class CustomerProfilePageProvider
    extends BlocProvider<CustomerProfilePageBloc> {
  CustomerProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerProfilePageBloc(context),
          child: const CustomerProfilePageView(),
        );
}
