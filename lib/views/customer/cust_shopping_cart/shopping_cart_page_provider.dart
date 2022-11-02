import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'shopping_cart_page_bloc.dart';
import 'shopping_cart_page_view.dart';

class ShoppingCartPageProvider extends BlocProvider<ShoppingCartPageBloc> {
  ShoppingCartPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => ShoppingCartPageBloc(context),
          child: const ShoppingCartPageView(),
        );
}
