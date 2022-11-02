// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:developer';
// import 'package:medisan/models/product_model.dart';
import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/customer/cust_item_search/all_item_search_page_provider.dart';
import 'package:medisan/views/customer/cust_home/cust_home_topbar.dart';
import 'package:medisan/views/customer/cust_product_details/customer_product_details_page_view.dart';
import 'package:medisan/views/customer/cust_products/customer_product_list_page_event.dart';
import 'package:medisan/views/customer/cust_shopping_cart/shopping_cart_page_event.dart';
import 'package:medisan/views/customer/cust_shopping_cart/shopping_cart_page_state.dart';
import '../cust_shopping_cart/shopping_cart_page_bloc.dart';
import '../cust_shopping_cart/shopping_cart_page_view.dart';
// import 'package:medisan/utilities/util_popup_btn.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:uuid/uuid.dart';
import '../../../utilities/util_card_product.dart';
// import '../../../utilities/util_update_btn.dart';
import 'customer_product_list_page_bloc.dart';
import 'customer_product_list_page_state.dart';

class CustomerProductListPageView extends StatefulWidget {
  final String title;
  const CustomerProductListPageView({required this.title, Key? key})
      : super(key: key);

  @override
  _CustomerProductListPageViewState createState() =>
      _CustomerProductListPageViewState();
}

class _CustomerProductListPageViewState
    extends State<CustomerProductListPageView> {
  @override
  Widget build(BuildContext context) {
    ShoppingCartPageBloc shoppingCartPagebloc =
        BlocProvider.of<ShoppingCartPageBloc>(context);
    CustomerProductListPageBloc bloc =
        BlocProvider.of<CustomerProductListPageBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.SCAFFOLD,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const CustomerTabBarView()),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/icons/logo_icon.png',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider.value(
                        value: shoppingCartPagebloc,
                        child: const ShoppingCartPageView(),
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 40.0,
                    ),
                    const Positioned(
                      top: 20.0,
                      left: 10.0,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: CustomColors.SECONDARY,
                      ),
                    ),
                    BlocBuilder<ShoppingCartPageBloc, ShoppingCartPageState>(
                      buildWhen: (previous, current) =>
                          previous.isLoading != current.isLoading,
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const Center();
                        }
                        return Positioned(
                          top: 5.0,
                          right: 20.0,
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomColors.PRIMARY,
                            ),
                            child: Center(
                              child: Text(
                                '${state.cartItem}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.BACKGROUND,
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<CustomerProductListPageBloc,
          CustomerProductListPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.itemCount != current.itemCount,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AllItemSearchPageProvider(
                                category: widget.title,
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 500.0,
                    child: widget.title == 'All'
                        ? ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: CusProductCard(
                                  productModel: state.products[index],
                                  tapAddItem: () {
                                    var uuid = const Uuid();
                                    var itemWithQuantity = {
                                      "id": uuid.v4(),
                                      "product": state.products[index],
                                      "count": state.itemCount
                                    };
                                    log(itemWithQuantity.toString());
                                    shoppingCartPagebloc.add(AddToCartEvent(
                                        cartItems: itemWithQuantity));
                                    bloc.add(cartEvent(
                                        cartProduct: itemWithQuantity));
                                  },
                                  tap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            CustomerProductDetailsPageView(
                                              productModel:
                                                  state.products[index],
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          )
                        : widget.title == 'Color cosmetics'
                            ? ListView.builder(
                                itemCount: state.colorCosmetics.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: CusProductCard(
                                      productModel: state.colorCosmetics[index],
                                      tapAddItem: () {
                                        var uuid = const Uuid();
                                        var itemWithQuantity = {
                                          "id": uuid.v4(),
                                          "product": state.products[index],
                                          "count": state.itemCount
                                        };
                                        log(itemWithQuantity.toString());
                                        shoppingCartPagebloc.add(AddToCartEvent(
                                            cartItems: itemWithQuantity));
                                        bloc.add(cartEvent(
                                            cartProduct: itemWithQuantity));
                                      },
                                      tap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                CustomerProductDetailsPageView(
                                                  productModel: state
                                                      .colorCosmetics[index],
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              )
                            : widget.title == 'fragrance'
                                ? ListView.builder(
                                    itemCount: state.fragrance.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: CusProductCard(
                                          productModel: state.fragrance[index],
                                          tapAddItem: () {
                                            var uuid = const Uuid();
                                            var itemWithQuantity = {
                                              "id": uuid.v4(),
                                              "product": state.products[index],
                                              "count": state.itemCount
                                            };
                                            log(itemWithQuantity.toString());
                                            shoppingCartPagebloc.add(
                                                AddToCartEvent(
                                                    cartItems:
                                                        itemWithQuantity));
                                            bloc.add(cartEvent(
                                                cartProduct: itemWithQuantity));
                                          },
                                          tap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    CustomerProductDetailsPageView(
                                                      productModel: state
                                                          .fragrance[index],
                                                    )),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  )
                                : widget.title == 'Skin Care'
                                    ? ListView.builder(
                                        itemCount: state.skinCare.length,
                                        itemBuilder: ((context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: CusProductCard(
                                              productModel:
                                                  state.skinCare[index],
                                              tapAddItem: () {
                                                var uuid = const Uuid();
                                                var itemWithQuantity = {
                                                  "id": uuid.v4(),
                                                  "product":
                                                      state.products[index],
                                                  "count": state.itemCount
                                                };
                                                log(itemWithQuantity
                                                    .toString());
                                                shoppingCartPagebloc.add(
                                                    AddToCartEvent(
                                                        cartItems:
                                                            itemWithQuantity));
                                                bloc.add(cartEvent(
                                                    cartProduct:
                                                        itemWithQuantity));
                                              },
                                              tap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: ((context) =>
                                                        CustomerProductDetailsPageView(
                                                          productModel: state
                                                              .skinCare[index],
                                                        )),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),
                                      )
                                    : ListView.builder(
                                        itemCount: state.hairCare.length,
                                        itemBuilder: ((context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: CusProductCard(
                                              productModel:
                                                  state.hairCare[index],
                                              tapAddItem: () {
                                                var uuid = const Uuid();
                                                var itemWithQuantity = {
                                                  "id": uuid.v4(),
                                                  "product":
                                                      state.products[index],
                                                  "count": state.itemCount
                                                };
                                                log(itemWithQuantity
                                                    .toString());
                                                shoppingCartPagebloc.add(
                                                    AddToCartEvent(
                                                        cartItems:
                                                            itemWithQuantity));
                                                bloc.add(cartEvent(
                                                    cartProduct:
                                                        itemWithQuantity));
                                              },
                                              tap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: ((context) =>
                                                        CustomerProductDetailsPageView(
                                                          productModel: state
                                                              .hairCare[index],
                                                        )),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        }),
                                      ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
