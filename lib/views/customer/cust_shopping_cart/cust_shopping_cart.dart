import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/customer/cust_order_main/cust_place_order/cust_place_order_event.dart';
import 'package:medisan/views/customer/cust_product_main/cust_products/customer_product_list_page_event.dart';
import 'package:medisan/views/customer/cust_order_main/cust_select_address/cust_address_select_provider.dart';
import 'package:medisan/views/customer/cust_shopping_cart/cust_shopping_cart_event.dart';
import 'package:medisan/views/customer/cust_shopping_cart/cust_shopping_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../cust_order_main/cust_place_order/cust_place_order_bloc.dart';
import '../cust_product_main/cust_products/customer_product_list_page_bloc.dart';
import 'cust_shopping_cart_bloc.dart';

class ShoppingCartPageView extends StatefulWidget {
  const ShoppingCartPageView({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageViewState createState() => _ShoppingCartPageViewState();
}

class _ShoppingCartPageViewState extends State<ShoppingCartPageView> {
  @override
  Widget build(BuildContext context) {
    CustomerPlaceOrderPageBloc cusPlaceOrderBloc =
        BlocProvider.of<CustomerPlaceOrderPageBloc>(context);
    ShoppingCartPageBloc bloc = BlocProvider.of<ShoppingCartPageBloc>(context);
    CustomerProductListPageBloc cplBLoc =
        BlocProvider.of<CustomerProductListPageBloc>(context);
    return Scaffold(
      // APP BAR OF SHOPPING CART
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          width: double.infinity,
          height: 100.0,
          color: CustomColors.PRIMARY,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: CustomColors.BACKGROUND,
                      )),
                  Text(
                    'Shopping Cart',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: CustomColors.BACKGROUND,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 40.0,
                      ),

                      // SHOPPING CART ICON
                      const Positioned(
                        top: 30.0,
                        left: 10.0,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: CustomColors.BACKGROUND,
                        ),
                      ),

                      // NO OF CART ITEMS
                      BlocBuilder<ShoppingCartPageBloc, ShoppingCartPageState>(
                        buildWhen: (previous, current) =>
                            previous.isLoading != current.isLoading,
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          return Positioned(
                            top: 15.0,
                            right: 20.0,
                            child: Container(
                              width: 20.0,
                              height: 20.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomColors.BACKGROUND,
                              ),
                              child: Center(
                                child: Text(
                                  state.cartItem.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                      ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

      // CART VIEW BODY
      body: BlocBuilder<ShoppingCartPageBloc, ShoppingCartPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.selectItem != current.selectItem,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          // ALL CART PRODUCTS
          return ListView.builder(
            itemCount: state.selectItem.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: CustomColors.SECONDARY,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // PRODUCT IMAGE
                        Image.network(
                          state.selectItem[index]['product'].imageUrl,
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // PRODUCT NAME
                            SizedBox(
                              width: 120.0,
                              child: Expanded(
                                child: Text(
                                  state.selectItem[index]['product'].name,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.ONSURFACE,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),

                            // PRODUCT PRICE
                            Row(
                              children: [
                                Text(
                                  '${state.selectItem[index]['product'].productPrice} \$',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                      ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),

                                // PRODUCT QUANTITY
                                Text(
                                  '${state.selectItem[index]['product'].productQuantity} ML',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),

                            // PRODUCT COUNT
                            Row(
                              children: [
                                Text(
                                  'x',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.ONSURFACE,
                                      ),
                                ),
                                Text(
                                  '${state.selectItem[index]['count']}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        color: CustomColors.ONSURFACE,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // TOTAL PRICE OF PRODUCTS
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.selectItem[index]['product'].productPrice * state.selectItem[index]['count']}\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.PRIMARY,
                                  ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            const Text('')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),

      // BOTTOM NAV FOR CLEAR CART AND ORDER
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // CLEAR CART BUTTON
            InkWell(
              onTap: () {
                bloc.add(ClearCartEvent());
                cplBLoc.add(ClearMainCartEvent());
              },
              child: Container(
                width: 150.0,
                height: 42.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: CustomColors.PRIMARY,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Clear Cart',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),

            // BUY CART BUTTON
            InkWell(
              onTap: () {
                cusPlaceOrderBloc.add(
                    LastAddProductsEvent(shoppingCart: bloc.state.selectItem));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cusPlaceOrderBloc,
                      child: CustomerSelectAddressPageProvider(),
                    ),
                  ),
                );
              },
              child: Container(
                height: 42.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: CustomColors.PRIMARY,
                  // border: Border.all(
                  //   color: CustomColors.SECONDARY,
                  // ),
                ),
                child: Center(
                  child: Text(
                    'Buy Cart',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.BACKGROUND,
                        ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
// class LineInputField extends StatelessWidget {
//   final String hintText;
//   final int maxLength;
//   final TextEditingController controller;
//   final FieldValidator validator;
//   final String keyBoardType;

//   const LineInputField({
//     Key? key,
//     this.keyBoardType = 'text',
//     required this.controller,
//     required this.hintText,
//     required this.maxLength,
//     required this.validator,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       validator: validator,
//       keyboardType:
//           keyBoardType == 'text' ? TextInputType.text : TextInputType.phone,
//       maxLength: maxLength,
//       cursorColor: CustomColors.ONSURFACE,
//       decoration: InputDecoration(
//         errorStyle: const TextStyle(fontSize: 12),
//         labelText: hintText,
//         labelStyle: Theme.of(context).textTheme.headline3,
//         hintText: '',
//         hintStyle: Theme.of(context).textTheme.headline5,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//       ),
//     );
//   }
// }
