import 'dart:developer';
import 'package:medisan/models/product_model.dart';
import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/customer/cust_shopping_cart/cust_shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../../cust_shopping_cart/cust_shopping_cart_bloc.dart';
import '../../cust_shopping_cart/cust_shopping_cart_event.dart';

// MORE VIEW OF ALL PRODUCTS -CUSTOMER, OWNER
class CustomerProductDetailsPageView extends StatefulWidget {
  final ProductModel productModel;
  final String mode;
  const CustomerProductDetailsPageView(
      {required this.productModel, this.mode = 'customer', Key? key})
      : super(key: key);

  @override
  _CustomerProductDetailsPageViewState createState() =>
      _CustomerProductDetailsPageViewState();
}

class _CustomerProductDetailsPageViewState
    extends State<CustomerProductDetailsPageView> {
  // int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    // ShoppingCartPageBloc shoppingCartPagebloc =
    //     BlocProvider.of<ShoppingCartPageBloc>(context);
    return Scaffold(
      // APP BAR WITH BACK ICON
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
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text('')
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // IMAGE CONTAINER
              Container(
                width: double.infinity,
                height: 260.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    color: CustomColors.BACKGROUND),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(140.0),
                    ),
                    child: Image.network(
                      widget.productModel.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // DETAILS CONTAINER
              Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: CustomColors.SURFACE,
                      border: Border.all(
                        color: CustomColors.PRIMARY,
                      )),
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // NAME
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                widget.productModel.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      color: CustomColors.ONSURFACE,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                            ]),
                        const SizedBox(
                          height: 20.0,
                        ),

                        // PRICE
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: CustomColors.ONSURFACE,
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                'Rs. ${widget.productModel.productPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: CustomColors.SECONDARY,
                                    ),
                              ),
                            ]),

                        // QUANTITY
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quantity: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: CustomColors.ONSURFACE,
                                    // fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '${widget.productModel.productQuantity}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        // ABOUT PRODUCT
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'About Product: ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.ONSURFACE,
                                      // fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                widget.productModel.aboutProduct,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: CustomColors.SECONDARY,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                        const SizedBox(
                          height: 20.0,
                        ),
                        widget.mode == 'customer'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      // InkWell(
                                      //   onTap: () {
                                      //     setState(() {
                                      //       itemCount = itemCount - 1;
                                      //       if (itemCount <= 0) {
                                      //         itemCount = 0;
                                      //       }
                                      //     });
                                      //   },
                                      //   child:
                                      //       Image.asset('assets/icons/dec.png'),
                                      // ),
                                      // const SizedBox(
                                      //   width: 10.0,
                                      // ),
                                      // Text(
                                      //   '$itemCount',
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .headline4!
                                      //       .copyWith(
                                      //         color: CustomColors.ONSURFACE,
                                      //       ),
                                      // ),
                                      // const SizedBox(
                                      //   width: 10.0,
                                      // ),
                                      // InkWell(
                                      //   onTap: () {
                                      //     setState(() {
                                      //       itemCount += 1;
                                      //     });
                                      //   },
                                      //   child:
                                      //       Image.asset('assets/icons/inc.png'),
                                      // ),
                                    ],
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     var uuid = const Uuid();
                                  //     var itemWithQuantity = {
                                  //       "id": uuid.v4(),
                                  //       "product": widget.productModel,
                                  //       "count": itemCount
                                  //     };
                                  //     log(itemWithQuantity.toString());
                                  //     shoppingCartPagebloc.add(AddToCartEvent(
                                  //         cartItems: itemWithQuantity));
                                  //     log(shoppingCartPagebloc.state.cartItem
                                  //         .toString());
                                  //   },
                                  //   child: Container(
                                  //     width: 100.0,
                                  //     height: 40.0,
                                  // decoration: BoxDecoration(
                                  //   borderRadius:
                                  //       BorderRadius.circular(10.0),
                                  //   color: CustomColors.BACKGROUND,
                                  // ),
                                  // child: Center(
                                  //   child: Text(
                                  //     'Add',
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .headline4!
                                  //         .copyWith(
                                  //           color: CustomColors.PRIMARY,
                                  //         ),
                                  //   ),
                                  // ),
                                  //   ),
                                  // )
                                ],
                              )
                            : Container()
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
