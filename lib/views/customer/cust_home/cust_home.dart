import 'package:medisan/views/customer/cust_product_main/cust_products/customer_product_list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/color_palette.dart';
import '../../../utilities/util_carousel_slider.dart';
import '../cust_item_search/all_item_search_provider.dart';
import '../cust_order_main/cust_order/cust_order_bloc.dart';
import '../cust_order_main/cust_order/cust_order_state.dart';
import '../cust_profile/cust_profile_provider.dart';

class CustomerHomePageView extends StatefulWidget {
  const CustomerHomePageView({Key? key}) : super(key: key);

  @override
  _CustomerHomePageViewState createState() => _CustomerHomePageViewState();
}

class _CustomerHomePageViewState extends State<CustomerHomePageView> {
  @override
  Widget build(BuildContext context) {
    CustomerOrderPageBloc bloc =
        BlocProvider.of<CustomerOrderPageBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 130,
                  ),
                  Positioned(
                    child: Container(
                      height: 120.0,
                      color: CustomColors.PRIMARY,
                    ),
                  ),

                  // MEDISAN LOGO
                  Positioned(
                    top: 40.0,
                    left: 10.0,
                    child: Text(
                      'MediSan',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: CustomColors.BACKGROUND,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 45,
                  //   left: 160.0,
                  //   right: 70.0,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: ((context) => AllItemSearchPageProvider(
                  //                 productType: 'ALL',
                  //               )),
                  //         ),
                  //       );
                  //     },
                  // child: Container(
                  //   width: 400,
                  //   height: 42.0,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     color: CustomColors.BACKGROUND,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.grey.withOpacity(0.5),
                  //         spreadRadius: 5,
                  //         blurRadius: 7,
                  //         offset: const Offset(0, 3),
                  //       ),
                  //     ],
                  //   ),
                  // child: Padding(
                  //   padding: const EdgeInsets.only(left: 20.0),
                  //   child: Row(
                  //     children: [
                  //       const Icon(
                  //         Icons.search,
                  //         color: CustomColors.SECONDARY,
                  //       ),
                  //       const SizedBox(
                  //         width: 10.0,
                  //       ),
                  //       Text(
                  //         ' Search here',
                  //         style: Theme.of(context)
                  //             .textTheme
                  //             .headline4!
                  //             .copyWith(
                  //               color: CustomColors.SECONDARY,
                  //             ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  //     ),
                  //   ),
                  // ),

                  // CUSTOMER PROFILE VIEW
                  Positioned(
                      bottom: 55,
                      left: 350.0,
                      // right: 70.0,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) =>
                                    CustomerProfilePageProvider()),
                              ),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Row(children: [
                                const Icon(
                                  Icons.account_circle,
                                  color: CustomColors.BACKGROUND,
                                ),
                              ]))))
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            // ALL PRODUCTS CARDS BY TYPE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Products',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: CustomColors.ONSURFACE,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // ALL PRODUCTS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomerMainMenuItem(
                        tap: () {
                          // NAVIGATE TO THE PRODUCT LIST PAGE WHICH SHOWS ALL PRODUCTS
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) =>
                                  CustomerProductListPageProvider(
                                    title: 'All',
                                  )),
                            ),
                          );
                        },
                        imagePath: 'assets/icons/allProducts.png',
                        title: 'All',
                      ),
                      // CustomerMainMenuItem(
                      //   tap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: ((context) =>
                      //             CustomerProductListPageProvider(
                      //               title: 'medicine',
                      //             )),
                      //       ),
                      //     );
                      //   },
                      //   imagePath: 'assets/icons/capsule.png',
                      //   title: 'medicine',
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // MEDICINES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CustomerMainMenuItem(
                      //   tap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: ((context) =>
                      //             CustomerProductListPageProvider(
                      //               title: 'All',
                      //             )),
                      //       ),
                      //     );
                      //   },
                      //   imagePath: 'assets/icons/icons8-cosmetics-65.png',
                      //   title: 'All',
                      // ),
                      CustomerMainMenuItem(
                        tap: () {
                          // NAVIGATE TO THE PRODUCT LIST PAGE WHICH SHOWS MEDICINES
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) =>
                                  CustomerProductListPageProvider(
                                    title: 'medicine',
                                  )),
                            ),
                          );
                        },
                        imagePath: 'assets/icons/capsule.png',
                        title: 'medicine',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // HEALTHCARE PRODUCTS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomerMainMenuItem(
                        tap: () {
                          // NAVIGATE TO THE PRODUCT LIST PAGE WHICH SHOWS HEALTHCARE PRODUCTS
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) =>
                                  CustomerProductListPageProvider(
                                    title: 'healthcare',
                                  )),
                            ),
                          );
                        },
                        imagePath: 'assets/icons/healthcare.png',
                        title: 'healthcare',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  // LAB TESTS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomerMainMenuItem(
                        tap: () {
                          // NAVIGATE TO THE PRODUCT LIST PAGE WHICH SHOWS LAB TEST PRODUCTS
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) =>
                                  CustomerProductListPageProvider(
                                    title: 'labTests',
                                  )),
                            ),
                          );
                        },
                        imagePath: 'assets/icons/labTest.png',
                        title: 'labTests',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CARDS WHICH SHOWS DIFFERENT PRODUCT TYPES IN HOME PAGE
class CustomerMainMenuItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback tap;

  const CustomerMainMenuItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 350.0,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.BACKGROUND,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
