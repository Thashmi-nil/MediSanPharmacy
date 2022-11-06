// import 'package:medisan/views/customer/cust_products/customer_product_list_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../styles/color_palette.dart';
import '../../../utilities/util_carousel_slider.dart';
// import '../cust_item_search/all_item_search_page_provider.dart';
// import '../cust_order/customer_order_page_bloc.dart';
// import '../cust_order/customer_order_page_state.dart';

class PCheckerHomePageView extends StatefulWidget {
  const PCheckerHomePageView({Key? key}) : super(key: key);

  @override
  _PCheckerHomePageViewState createState() => _PCheckerHomePageViewState();
}

class _PCheckerHomePageViewState extends State<PCheckerHomePageView> {
  @override
  Widget build(BuildContext context) {
    // CustomerOrderPageBloc bloc =
    //     BlocProvider.of<CustomerOrderPageBloc>(context);
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
                  Positioned(
                    bottom: 45,
                    left: 200.0,
                    right: 15.0,
                    child: InkWell(
                      // onTap: () {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: ((context) => AllItemSearchPageProvider(
                      //             productType: 'ALL',
                      //           )),
                      //     ),
                      //   );
                      // },
                      child: Container(
                        width: 400,
                        height: 42.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomColors.BACKGROUND,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: CustomColors.SECONDARY,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                ' Search here',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.SECONDARY,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'productType',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: CustomColors.ONSURFACE,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     PCheckerMainMenuItem(
                  //       tap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: ((context) =>
                  //                 CustomerProductListPageProvider(
                  //                   title: 'All',
                  //                 )),
                  //           ),
                  //         );
                  //       },
                  //       imagePath: 'assets/icons/allProducts.png',
                  //       title: 'All',
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     PCheckerMainMenuItem(
                  //       tap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: ((context) =>
                  //                 CustomerProductListPageProvider(
                  //                   title: 'medicine',
                  //                 )),
                  //           ),
                  //         );
                  //       },
                  //       imagePath: 'assets/icons/capsule.png',
                  //       title: 'medicine',
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     PCheckerMainMenuItem(
                  //       tap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: ((context) =>
                  //                 CustomerProductListPageProvider(
                  //                   title: 'healthcare',
                  //                 )),
                  //           ),
                  //         );
                  //       },
                  //       imagePath: 'assets/icons/healthcare.png',
                  //       title: 'healthcare',
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     PCheckerMainMenuItem(
                  //       tap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //             builder: ((context) =>
                  //                 CustomerProductListPageProvider(
                  //                   title: 'Lab Tests',
                  //                 )),
                  //           ),
                  //         );
                  //       },
                  //       imagePath: 'assets/icons/labTest.png',
                  //       title: 'Lab Tests',
                  //     ),
                  //   ],
                  // ),
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

class PCheckerMainMenuItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback tap;

  const PCheckerMainMenuItem({
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
