import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cust_shopping_cart_bloc.dart';
import 'cust_shopping_cart.dart';

class ShoppingCartPageProvider extends BlocProvider<ShoppingCartPageBloc> {
  ShoppingCartPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => ShoppingCartPageBloc(context),
          child: const ShoppingCartPageView(),
        );
}
