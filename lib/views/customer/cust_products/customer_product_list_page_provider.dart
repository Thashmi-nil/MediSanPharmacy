import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_product_list_page_bloc.dart';
import 'customer_product_list_page_view.dart';

class CustomerProductListPageProvider
    extends BlocProvider<CustomerProductListPageBloc> {
  final String title;
  CustomerProductListPageProvider({required this.title, Key? key})
      : super(
          key: key,
          create: (context) => CustomerProductListPageBloc(context),
          child: CustomerProductListPageView(
            title: title,
          ),
        );
}
