import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_profile_page_bloc.dart';
import 'customer_profile_page_view.dart';

class CustomerProfilePageProvider
    extends BlocProvider<CustomerProfilePageBloc> {
  CustomerProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerProfilePageBloc(context),
          child: const CustomerProfilePageView(),
        );
}
