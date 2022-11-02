import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/color_palette.dart';
import '../../customer/cust_order/customer_order_page_bloc.dart';
import '../../customer/cust_order/customer_order_page_provider.dart';
import '../own_new_product/new_product_provider.dart';
import '../own_profile/own_profile_provider.dart';
import 'own_home_provider.dart';

class AdminTabBarView extends StatefulWidget {
  const AdminTabBarView({Key? key}) : super(key: key);

  @override
  _AdminTabBarViewState createState() => _AdminTabBarViewState();
}

class _AdminTabBarViewState extends State<AdminTabBarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminHomePageProvider(),
    AddProductPageProvider(),
    CustomerOrderPageProvider(
      role: 'admin',
    ),
    AdminProfilePageProvider(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomerOrderPageBloc bloc =
        BlocProvider.of<CustomerOrderPageBloc>(context);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70.0,
        child: BottomNavigationBar(
          backgroundColor: CustomColors.SCAFFOLD,
          selectedItemColor: CustomColors.PRIMARY,
          selectedFontSize: 16.0,
          unselectedLabelStyle:
              const TextStyle(fontSize: 16.0, color: CustomColors.ONSURFACE),
          elevation: 15,
          onTap: onTabTapped,
          unselectedIconTheme: const IconThemeData(
            color: CustomColors.SECONDARY,
          ),
          unselectedItemColor: CustomColors.ONSURFACE,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_photos_outlined,
              ),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
