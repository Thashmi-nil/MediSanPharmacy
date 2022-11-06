import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_product_details_bloc.dart';

class CustomerProductDetailsPageProvider
    extends BlocProvider<CustomerProductDetailsPageBloc> {
  CustomerProductDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerProductDetailsPageBloc(context),
          // child: const CustomerProductDetailsPageView(),
        );
}
