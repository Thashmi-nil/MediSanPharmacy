// import 'package:medisan/views/customer/cust_item_search/all_item_search_page_provider.dart';
// import 'package:medisan/views/customer/cust_home/cust_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medisan/views/prescriptionChecker/pcheck_home/pcheck_home_provider.dart';
import '../../../styles/color_palette.dart';
// import '../cust_order/customer_order_page_bloc.dart';
// import '../cust_order/customer_order_page_provider.dart';
import '../pcheck_profile/pcheck_profile_provider.dart';

class PCheckerTabBarView extends StatefulWidget {
  const PCheckerTabBarView({Key? key}) : super(key: key);

  @override
  _PCheckerTabBarViewState createState() => _PCheckerTabBarViewState();
}

class _PCheckerTabBarViewState extends State<PCheckerTabBarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PCheckerHomePageProvider(),
    // AllItemSearchPageProvider(
    //   searchLocation: 'tabbar',
    //   productType: 'ALL',
    // ),
    // CustomerOrderPageProvider(
    //   role: 'customer',
    // ),
    PCheckerProfilePageProvider(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // CustomerOrderPageBloc cusBloc =
    //     BlocProvider.of<CustomerOrderPageBloc>(context);
    return Scaffold(
      // body: _children[_currentIndex],
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
              label: 'Prescriptions',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_rounded,
              ),
              label: 'New order',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.shopping_bag_outlined,
            //   ),
            //   label: 'My Orders',
            // ),
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
