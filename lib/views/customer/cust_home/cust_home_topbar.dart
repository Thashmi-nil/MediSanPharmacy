import 'package:medisan/views/customer/cust_item_search/all_item_search_page_provider.dart';
import 'package:medisan/views/customer/cust_home/cust_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/color_palette.dart';
import '../cust_order/customer_order_page_bloc.dart';
import '../cust_order/customer_order_page_provider.dart';
import '../cust_profile/customer_profile_page_provider.dart';

class CustomerTabBarView extends StatefulWidget {
  const CustomerTabBarView({Key? key}) : super(key: key);

  @override
  _CustomerTabBarViewState createState() => _CustomerTabBarViewState();
}

class _CustomerTabBarViewState extends State<CustomerTabBarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CustomerHomePageProvider(),
    AllItemSearchPageProvider(
      searchLocation: 'tabbar',
      category: 'ALL',
    ),
    CustomerOrderPageProvider(
      role: 'customer',
    ),
    CustomerProfilePageProvider(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomerOrderPageBloc cusBloc =
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
                Icons.list_alt_rounded,
              ),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
              ),
              label: 'My Orders',
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
