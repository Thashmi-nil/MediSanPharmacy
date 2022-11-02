import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all_item_search_page_bloc.dart';
import 'all_item_search_page_view.dart';

class AllItemSearchPageProvider extends BlocProvider<AllItemSearchPageBloc> {
  final String title;
  final String searchLocation;
  final String category;
  final String mode;
  AllItemSearchPageProvider(
      {this.title = 'ALL',
      this.searchLocation = 'normal',
      this.category = 'fragrance',
      this.mode = 'customer',
      Key? key})
      : super(
          key: key,
          create: (context) => AllItemSearchPageBloc(context),
          child: AllItemSearchPageView(
            title: title,
            searchLocation: searchLocation,
            category: category,
            mode: mode,
          ),
        );
}
