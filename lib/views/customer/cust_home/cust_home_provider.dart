import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_home_bloc.dart';
import 'cust_home.dart';

class CustomerHomePageProvider extends BlocProvider<CustomerHomePageBloc> {
  CustomerHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerHomePageBloc(context),
          child: const CustomerHomePageView(),
        );
}
