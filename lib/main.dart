import 'dart:developer';
import 'package:medisan/views/customer/cust_shopping_cart/cust_shopping_cart_bloc.dart';
import 'package:medisan/views/initials/page_one.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'styles/themes.dart';
import 'views/owner/own_new_product/get_category/get_category_bloc.dart';
import 'views/owner/own_home/own_topbar.dart';
import 'views/owner/own_home/own_home_bloc.dart';
import 'views/customer/cust_home/cust_home_topbar.dart';
import 'views/customer/cust_order_main/cust_order/cust_order_bloc.dart';
import 'views/customer/cust_order_main/cust_place_order/cust_place_order_bloc.dart';
import 'views/customer/cust_product_main/cust_products/customer_product_list_page_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLoggedUser(),
      builder: ((context, snapshot) {
        log(snapshot.data.toString());
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetCategoryBloc(context)),
            BlocProvider(create: (context) => AdminHomePageBloc(context)),
            BlocProvider(create: (context) => ShoppingCartPageBloc(context)),
            BlocProvider(
                create: (context) => CustomerProductListPageBloc(context)),
            BlocProvider(create: (context) => CustomerOrderPageBloc(context)),
            BlocProvider(
                create: (context) => CustomerPlaceOrderPageBloc(context)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'medisan',
            theme: CustomThemes.lightTheme(context),
            home: snapshot.hasData
                ? snapshot.data == 'adminowner@gmail.com'
                    ? const AdminTabBarView()
                    : const CustomerTabBarView()
                : const PageOne(),
          ),
        );
      }),
    );
  }

  Future<String?> getLoggedUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser!.email;
  }
}
