import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_product_bloc.dart';
import 'new_product_view.dart';

class AddProductPageProvider extends BlocProvider<AddProductPageBloc> {
  AddProductPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AddProductPageBloc(context),
          child: const AddProductPageView(),
        );
}
