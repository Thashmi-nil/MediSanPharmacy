import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_product_details_page_bloc.dart';

class CustomerProductDetailsPageProvider
    extends BlocProvider<CustomerProductDetailsPageBloc> {
  CustomerProductDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerProductDetailsPageBloc(context),
          // child: const CustomerProductDetailsPageView(),
        );
}
