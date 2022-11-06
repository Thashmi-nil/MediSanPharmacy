// import 'dart:developer';

// import 'package:medisan/models/product_model.dart';
import 'package:medisan/views/owner/own_products/own_products_view.dart';
import 'package:medisan/views/owner/own_home/own_home_state.dart';
import 'package:medisan/views/customer/cust_order_main/cust_order/cust_order_bloc.dart';
// import 'package:medisan/views/customer/cust_order/customer_order_page_state.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles/color_palette.dart';
import '../../customer/cust_item_search/all_item_search_provider.dart';
// import '../../initials/page_two.dart';
import 'own_home_bloc.dart';

import '../own_profile/own_profile_provider.dart';

class AdminHomePageView extends StatefulWidget {
  const AdminHomePageView({Key? key}) : super(key: key);

  @override
  _AdminHomePageViewState createState() => _AdminHomePageViewState();
}

class _AdminHomePageViewState extends State<AdminHomePageView> {
  late int tappedIndex = 0;
  bool isSelected = false;
  int selectedIndex = 1;
  List<String> menuItem = [
    'All',
    'medicine',
    'healthcare',
    'labTests',
  ];
  @override
  Widget build(BuildContext context) {
    // AdminHomePageBloc bloc = BlocProvider.of<AdminHomePageBloc>(context);
    // CustomerOrderPageBloc cusBloc =
    //     BlocProvider.of<CustomerOrderPageBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.SCAFFOLD,
      body: BlocBuilder<AdminHomePageBloc, AdminHomePageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.products.length != current.products.length,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.products.length > 0) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
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
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      color: CustomColors.BACKGROUND,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                        // Positioned(
                        //   top: 40.0,
                        //   right: 10.0,
                        //   child: Stack(
                        //     children: [
                        //       const SizedBox(
                        //         height: 60.0,
                        //         width: 50.0,
                        //       ),
                        // const Positioned(
                        //   top: 10.0,
                        //   child: Icon(
                        //     Icons.notifications,
                        //     size: 32.0,
                        //     color: CustomColors.BACKGROUND,
                        //   ),
                        // ),
                        // Positioned(
                        //     bottom: 30.0,
                        //     left: 15.0,
                        //     child: Container(
                        //       width: 25.0,
                        //       height: 25.0,
                        //       decoration: BoxDecoration(
                        //         shape: BoxShape.circle,
                        //         color: CustomColors.BACKGROUND,
                        //         border: Border.all(
                        //           color: CustomColors.SECONDARY,
                        //         ),
                        //       ),
                        //       child: Center(
                        //         child: BlocBuilder<CustomerOrderPageBloc,
                        //             CustomerOrderPageState>(
                        //           buildWhen: (previous, current) =>
                        //               previous.isLoading !=
                        //                   current.isLoading ||
                        //               previous.adminNotification !=
                        //                   current.adminNotification ||
                        //               previous.adminOrders !=
                        //                   current.adminOrders,
                        //           builder: (context, state) {
                        //             if (state.isLoading) {
                        //               return const Center();
                        //             }
                        //             if (state.adminOrders.isEmpty) {
                        //               return Text(
                        //                 '0',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headline4!
                        //                     .copyWith(
                        //                       color:
                        //                           CustomColors.ONSURFACE,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //               );
                        //             }
                        //             return Text(
                        //               '${state.adminNotification}',
                        //               style: Theme.of(context)
                        //                   .textTheme
                        //                   .headline4!
                        //                   .copyWith(
                        //                     color: CustomColors.ONSURFACE,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //             );
                        //           },
                        //         ),
                        //       ),
                        //     ))
                        //     ],
                        //   ),
                        // ),
                        Positioned(
                          bottom: 15,
                          left: 160.0,
                          right: 70.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      AllItemSearchPageProvider(
                                        mode: 'admin',
                                        productType: "ALL",
                                      )),
                                ),
                              );
                            },
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
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
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
                                      'Search',
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
                        Positioned(
                            bottom: 25,
                            left: 350.0,
                            // right: 70.0,
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          AdminProfilePageProvider()),
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
                  SizedBox(
                    height: 40.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: menuItem.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: tappedIndex == index
                                    ? CustomColors.PRIMARY
                                    : CustomColors.BACKGROUND,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        tappedIndex = index;
                                      });
                                    },
                                    child: Text(
                                      menuItem[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(
                                            color: tappedIndex == index
                                                ? CustomColors.BACKGROUND
                                                : CustomColors.SECONDARY,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  tappedIndex == 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: SizedBox(
                              height: 500.0,
                              child: GridView.builder(
                                itemCount: state.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent: 200,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemBuilder: (BuildContext context, int i) {
                                  return AdminProductCart(
                                    tap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              AdminProductDetailsPageView(
                                                  productModel:
                                                      state.products[i])),
                                        ),
                                      );
                                    },
                                    prodName: state.products[i].name,
                                    prodPrice:
                                        '${state.products[i].productPrice}',
                                    productQuantity:
                                        '${state.products[i].productQuantity}',
                                    imagePath: state.products[i].imageUrl,
                                  );
                                },
                              )),
                        )
                      : tappedIndex == 1
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                              ),
                              child: SizedBox(
                                  height: 500.0,
                                  child: GridView.builder(
                                    itemCount: state.skinCare.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 200,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                    ),
                                    itemBuilder: (BuildContext context, int i) {
                                      return AdminProductCart(
                                        tap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  AdminProductDetailsPageView(
                                                      productModel:
                                                          state.skinCare[i])),
                                            ),
                                          );
                                        },
                                        prodName: state.skinCare[i].name,
                                        prodPrice:
                                            '${state.skinCare[i].productPrice}',
                                        productQuantity:
                                            '${state.skinCare[i].productQuantity}',
                                        imagePath: state.skinCare[i].imageUrl,
                                      );
                                    },
                                  )),
                            )
                          : tappedIndex == 2
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  child: SizedBox(
                                      height: 500.0,
                                      child: GridView.builder(
                                        itemCount: state.hairCare.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisExtent: 200,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                        ),
                                        itemBuilder:
                                            (BuildContext context, int i) {
                                          return AdminProductCart(
                                            tap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: ((context) =>
                                                      AdminProductDetailsPageView(
                                                          productModel: state
                                                              .hairCare[i])),
                                                ),
                                              );
                                            },
                                            prodName: state.hairCare[i].name,
                                            prodPrice:
                                                '${state.hairCare[i].productPrice}',
                                            productQuantity:
                                                '${state.hairCare[i].productQuantity}',
                                            imagePath:
                                                state.hairCare[i].imageUrl,
                                          );
                                        },
                                      )),
                                )
                              : tappedIndex == 3
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: SizedBox(
                                          height: 500.0,
                                          child: GridView.builder(
                                            itemCount: state.fragrance.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisExtent: 200,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20,
                                            ),
                                            itemBuilder:
                                                (BuildContext context, int i) {
                                              return AdminProductCart(
                                                tap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: ((context) =>
                                                          AdminProductDetailsPageView(
                                                              productModel:
                                                                  state.fragrance[
                                                                      i])),
                                                    ),
                                                  );
                                                },
                                                prodName:
                                                    state.fragrance[i].name,
                                                prodPrice:
                                                    '${state.fragrance[i].productPrice}',
                                                productQuantity:
                                                    '${state.fragrance[i].productQuantity}',
                                                imagePath:
                                                    state.fragrance[i].imageUrl,
                                              );
                                            },
                                          )),
                                    )
                                  : tappedIndex == 4
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                          ),
                                          child: SizedBox(
                                              height: 500.0,
                                              child: GridView.builder(
                                                itemCount:
                                                    state.colorCosmetics.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisExtent: 200,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 20,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int i) {
                                                  return AdminProductCart(
                                                    tap: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: ((context) =>
                                                              AdminProductDetailsPageView(
                                                                  productModel:
                                                                      state.colorCosmetics[
                                                                          i])),
                                                        ),
                                                      );
                                                    },
                                                    prodName: state
                                                        .colorCosmetics[i].name,
                                                    prodPrice:
                                                        '${state.colorCosmetics[i].productPrice}',
                                                    productQuantity:
                                                        '${state.colorCosmetics[i].productQuantity}',
                                                    imagePath: state
                                                        .colorCosmetics[i]
                                                        .imageUrl,
                                                  );
                                                },
                                              )),
                                        )
                                      : const Text(''),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class AdminProductCart extends StatelessWidget {
  final String prodName;
  final String prodPrice;
  final String productQuantity;
  final String imagePath;
  final VoidCallback tap;

  const AdminProductCart({
    Key? key,
    required this.imagePath,
    required this.prodName,
    required this.prodPrice,
    required this.productQuantity,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 250.0,
        height: 200.0,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.BACKGROUND,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  prodName,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: CustomColors.ONSURFACE,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\Rs. $prodPrice',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                        ),
                  ),
                  Text(
                    '${productQuantity}',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Image.network(
                imagePath,
                width: 80.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
