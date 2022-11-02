import 'dart:developer';

import 'package:medisan/models/product_model.dart';
import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/owner/own_home/own_topbar.dart';
import 'package:medisan/views/customer/cust_item_search/all_item_search_page_event.dart';
import 'package:medisan/views/customer/cust_item_search/all_item_search_page_state.dart';
import 'package:medisan/views/customer/cust_home/cust_home_topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/util_card_product.dart';
import '../cust_product_details/customer_product_details_page_view.dart';
// import '../cust_products/customer_product_list_page_view.dart';
import '../cust_shopping_cart/shopping_cart_page_bloc.dart';
// import '../cust_shopping_cart/shopping_cart_page_event.dart';
import 'all_item_search_page_bloc.dart';

class AllItemSearchPageView extends StatefulWidget {
  final String title;
  final String searchLocation;
  final String category;
  final String mode;
  const AllItemSearchPageView({
    this.title = 'ALL',
    this.searchLocation = 'normal',
    this.category = 'fragrance',
    this.mode = 'customer',
    Key? key,
  }) : super(key: key);
  @override
  _AllItemSearchPageViewState createState() => _AllItemSearchPageViewState();
}

class _AllItemSearchPageViewState extends State<AllItemSearchPageView> {
  @override
  Widget build(BuildContext context) {
    ShoppingCartPageBloc shoppingCartPagebloc =
        BlocProvider.of<ShoppingCartPageBloc>(context);
    AllItemSearchPageBloc allItemSeBloc =
        BlocProvider.of<AllItemSearchPageBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.SCAFFOLD,
      appBar: widget.searchLocation == 'normal'
          ? PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.mode == 'customer'
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const CustomerTabBarView()),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_back),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const AdminTabBarView()),
                                ),
                              );
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: Colors.pink,
                        onChanged: (value) {
                          allItemSeBloc.add(SearchItemNameEvent(title: value));
                        },
                        decoration: InputDecoration(
                            hintText: " Search...",
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: CustomColors.SECONDARY,
                                style: BorderStyle.solid,
                                width: 3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: CustomColors.PRIMARY, width: 2.0),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              color: const Color.fromRGBO(93, 25, 72, 1),
                              onPressed: () {
                                setState(() {
                                  allItemSeBloc.add(ClearEvent());
                                });
                              },
                            )),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    )
                  ],
                ),
              ),
            )
          : PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: Container(
                color: CustomColors.PRIMARY,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.pink,
                          onChanged: (value) {
                            allItemSeBloc
                                .add(SearchItemNameEvent(title: value));
                          },
                          decoration: InputDecoration(
                              hintText: " Search...",
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 20, 0, 0),
                              hintStyle: Theme.of(context).textTheme.subtitle1,
                              filled: true,
                              fillColor: Colors.white,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: CustomColors.SECONDARY,
                                  style: BorderStyle.solid,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: CustomColors.PRIMARY, width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                color: const Color.fromRGBO(93, 25, 72, 1),
                                onPressed: () {
                                  setState(() {
                                    allItemSeBloc.add(ClearEvent());
                                  });
                                },
                              )),
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      body: BlocBuilder<AllItemSearchPageBloc, AllItemSearchPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.searchProducts.isEmpty) {
            return widget.category == 'Skin Care'
                ? ListView.builder(
                    itemCount: state.skinCare.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 20.0, right: 20.0, top: 10.0),
                        child: CusProductCard(
                          productModel: state.skinCare[index],
                          tapAddItem: () {
                            // bloc.add(cartEvent(
                            //     cartProduct:
                            //         state.hairCare[index]));
                          },
                          tap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) =>
                                    CustomerProductDetailsPageView(
                                      productModel: state.skinCare[index],
                                    )),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  )
                : widget.category == 'Hair Care'
                    ? ListView.builder(
                        itemCount: state.hairCare.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 20.0,
                                right: 20.0,
                                top: 10.0),
                            child: CusProductCard(
                              productModel: state.hairCare[index],
                              tapAddItem: () {
                                // bloc.add(cartEvent(
                                //     cartProduct:
                                //         state.hairCare[index]));
                              },
                              tap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        CustomerProductDetailsPageView(
                                          productModel: state.hairCare[index],
                                        )),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      )
                    : widget.category == 'fragrance'
                        ? ListView.builder(
                            itemCount: state.fragrance.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10.0),
                                child: CusProductCard(
                                  productModel: state.fragrance[index],
                                  tapAddItem: () {
                                    // bloc.add(cartEvent(
                                    //     cartProduct:
                                    //         state.hairCare[index]));
                                  },
                                  tap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            CustomerProductDetailsPageView(
                                              productModel:
                                                  state.fragrance[index],
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          )
                        : widget.category == 'Color cosmetics'
                            ? ListView.builder(
                                itemCount: state.colorCosmetics.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0,
                                        left: 20.0,
                                        right: 20.0,
                                        top: 10.0),
                                    child: CusProductCard(
                                      productModel: state.colorCosmetics[index],
                                      tapAddItem: () {
                                        // bloc.add(cartEvent(
                                        //     cartProduct:
                                        //         state.hairCare[index]));
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
                            : ListView.builder(
                                itemCount: state.products.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0,
                                        left: 20.0,
                                        right: 20.0,
                                        top: 10.0),
                                    child: CusProductCard(
                                      mode: widget.mode,
                                      productModel: state.products[index],
                                      tapAddItem: () {
                                        // bloc.add(cartEvent(
                                        //     cartProduct:
                                        //         state.hairCare[index]));
                                      },
                                      tap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                CustomerProductDetailsPageView(
                                                  mode: widget.mode,
                                                  productModel:
                                                      state.products[index],
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              );
          } else {
            return widget.category == 'Skin Care'
                ? ListView.builder(
                    itemCount: state.skinCare.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 20.0, right: 20.0, top: 10.0),
                        child: CusProductCard(
                          productModel: state.skinCare[index],
                          tapAddItem: () {
                            // bloc.add(cartEvent(
                            //     cartProduct:
                            //         state.hairCare[index]));
                          },
                          tap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) =>
                                    CustomerProductDetailsPageView(
                                      productModel: state.skinCare[index],
                                    )),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  )
                : widget.category == 'Hair Care'
                    ? ListView.builder(
                        itemCount: state.hairCare.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 20.0,
                                right: 20.0,
                                top: 10.0),
                            child: CusProductCard(
                              productModel: state.hairCare[index],
                              tapAddItem: () {
                                // bloc.add(cartEvent(
                                //     cartProduct:
                                //         state.hairCare[index]));
                              },
                              tap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        CustomerProductDetailsPageView(
                                          productModel: state.hairCare[index],
                                        )),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      )
                    : widget.category == 'fragrance'
                        ? ListView.builder(
                            itemCount: state.fragrance.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0,
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10.0),
                                child: CusProductCard(
                                  productModel: state.fragrance[index],
                                  tapAddItem: () {
                                    // bloc.add(cartEvent(
                                    //     cartProduct:
                                    //         state.hairCare[index]));
                                  },
                                  tap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            CustomerProductDetailsPageView(
                                              productModel:
                                                  state.fragrance[index],
                                            )),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          )
                        : widget.category == 'Color cosmetics'
                            ? ListView.builder(
                                itemCount: state.colorCosmetics.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0,
                                        left: 20.0,
                                        right: 20.0,
                                        top: 10.0),
                                    child: CusProductCard(
                                      productModel: state.colorCosmetics[index],
                                      tapAddItem: () {
                                        // bloc.add(cartEvent(
                                        //     cartProduct:
                                        //         state.hairCare[index]));
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
                            : ListView.builder(
                                itemCount: state.searchProducts.length,
                                itemBuilder: ((context, index) {
                                  log('hello');
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10.0,
                                      right: 20.0,
                                      left: 20.0,
                                      top: 10.0,
                                    ),
                                    child: CusProductCard(
                                      productModel: state.searchProducts[index],
                                      tapAddItem: () {
                                        // bloc.add(cartEvent(
                                        //     cartProduct:
                                        //         state.hairCare[index]));
                                      },
                                      tap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                CustomerProductDetailsPageView(
                                                  productModel: state
                                                      .searchProducts[index],
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                              );
          }
        },
      ),
    );
  }
}
