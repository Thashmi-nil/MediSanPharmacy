// WORKED AS THE DEPENDANCY INJECTION TO SEARCH ITEMS FROM THE DATABASE

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_item_search_bloc.dart';
import 'all_item_search.dart';

class AllItemSearchPageProvider extends BlocProvider<AllItemSearchPageBloc> {
  final String title;
  final String searchLocation;
  final String productType;
  final String mode;
  AllItemSearchPageProvider(
      {this.title = 'ALL',
      this.searchLocation = 'normal',
      this.productType = 'fragrance',
      this.mode = 'customer',
      Key? key})
      : super(
          key: key,
          create: (context) => AllItemSearchPageBloc(context),
          child: AllItemSearchPageView(
            title: title,
            searchLocation: searchLocation,
            productType: productType,
            mode: mode,
          ),
        );
}
