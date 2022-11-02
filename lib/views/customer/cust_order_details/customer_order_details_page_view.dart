// ignore_for_file: use_build_context_synchronously
import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/owner/own_home/own_topbar.dart';
import 'package:medisan/utilities/util_next_btn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/order_model.dart';
import '../../../utilities/util_main_appBar.dart';
import '../../../utilities/util_popup_ok_btn.dart';
import '../cust_order/customer_order_page_view.dart';
import 'customer_order_details_page_bloc.dart';

class CustomerOrderDetailsPageView extends StatefulWidget {
  final OrderModel ordermodel;
  final String role;
  const CustomerOrderDetailsPageView(
      {this.role = 'customer', required this.ordermodel, Key? key})
      : super(key: key);

  @override
  _CustomerOrderDetailsPageViewState createState() =>
      _CustomerOrderDetailsPageViewState();
}

class _CustomerOrderDetailsPageViewState
    extends State<CustomerOrderDetailsPageView> {
  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    CustomerOrderDetailsPageBloc bloc =
        BlocProvider.of<CustomerOrderDetailsPageBloc>(context);
    final double d = double.parse(widget.ordermodel.total);

    return Scaffold(
        backgroundColor: CustomColors.SCAFFOLD,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: CustomMainApp(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: CustomColors.BACKGROUND,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '${d.toStringAsFixed(2)} \$',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.ERROR,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Order ID',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  widget.ordermodel.orderId,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.ONSURFACE,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Order at',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  widget.ordermodel.date,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Divider(),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: CustomColors.BACKGROUND),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.ordermodel.products.length,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  OrderCartItem(
                                    count: widget.ordermodel.products[index]
                                        ['count'],
                                    price: widget.ordermodel.products[index]
                                        ['product']['price'],
                                    quantity: widget.ordermodel
                                        .products[index]['product']['quantity']
                                        .toString(),
                                    imageUrl: widget.ordermodel.products[index]
                                        ['product']['imageUrl'],
                                    name: widget.ordermodel.products[index]
                                        ['product']['name'],
                                  ),
                                  const Divider(),
                                ],
                              );
                            }),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Shipping Details',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.ordermodel.name,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Phone number',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              widget.ordermodel.phone,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Text(
                                '${widget.ordermodel.address} ${widget.ordermodel.city}',
                                overflow: TextOverflow.fade,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.SECONDARY,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        widget.role == 'admin'
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Image.asset('assets/images/Packing-I.png'),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  CustomNextButton(
                                    tap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            elevation: 16,
                                            child: Container(
                                              width: 250.0,
                                              height: 170.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: CustomColors.BACKGROUND,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Confirm',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4!
                                                          .copyWith(
                                                            color: CustomColors
                                                                .SECONDARY,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 24.0,
                                                    ),
                                                    Text(
                                                      'Would you like to continue?',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline4!
                                                          .copyWith(
                                                            color: CustomColors
                                                                .SECONDARY,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CustomPopupProceedButton(
                                                          tap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          isProceed: false,
                                                        ),
                                                        CustomPopupProceedButton(
                                                          tap: () async {
                                                            try {
                                                              DatabaseReference
                                                                  ref =
                                                                  FirebaseDatabase
                                                                      .instance
                                                                      .ref()
                                                                      .child(
                                                                          'order');
                                                              await ref
                                                                  .child(widget
                                                                      .ordermodel
                                                                      .mainID)
                                                                  .remove();
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          const AdminTabBarView()),
                                                                ),
                                                              );
                                                            } catch (e) {
                                                              Future.error(
                                                                  e.toString());
                                                            }
                                                          },
                                                          isProceed: true,
                                                        ),
                                                        // ButtonTheme(
                                                        //   minWidth: 120.0,
                                                        //   child: RaisedButton(
                                                        //     color: CustomColors
                                                        //         .BACKGROUND,
                                                        //     onPressed: () {
                                                        //       Navigator.of(
                                                        //               context)
                                                        //           .pop();
                                                        //     },
                                                        //     child: Text(
                                                        //       'Cancel',
                                                        //       style: Theme.of(
                                                        //               context)
                                                        //           .textTheme
                                                        //           .headline4!
                                                        //           .copyWith(
                                                        //             color: CustomColors
                                                        //                 .PRIMARY,
                                                        //             fontSize:
                                                        //                 18.0,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .bold,
                                                        //           ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        // ButtonTheme(
                                                        //   minWidth: 120.0,
                                                        //   child: RaisedButton(
                                                        //     onPressed:
                                                        //         () async {
                                                        //       try {
                                                        //         DatabaseReference
                                                        //             ref =
                                                        //             FirebaseDatabase
                                                        //                 .instance
                                                        //                 .ref()
                                                        //                 .child(
                                                        //                     'order');
                                                        //         await ref
                                                        //             .child(widget
                                                        //                 .ordermodel
                                                        //                 .mainID)
                                                        //             .remove();
                                                        //         Navigator.of(
                                                        //                 context)
                                                        //             .push(
                                                        //           MaterialPageRoute(
                                                        //             builder:
                                                        //                 ((context) =>
                                                        //                     const AdminTabBarView()),
                                                        //           ),
                                                        //         );
                                                        //       } catch (e) {
                                                        //         Future.error(e
                                                        //             .toString());
                                                        //       }
                                                        //     },
                                                        //     color: CustomColors
                                                        //         .PRIMARY,
                                                        //     child: Text(
                                                        //       'Proceed',
                                                        //       style: Theme.of(
                                                        //               context)
                                                        //           .textTheme
                                                        //           .headline4!
                                                        //           .copyWith(
                                                        //             color: CustomColors
                                                        //                 .BACKGROUND,
                                                        //             fontSize:
                                                        //                 18.0,
                                                        //             fontWeight:
                                                        //                 FontWeight
                                                        //                     .bold,
                                                        //           ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );

                                      // try {
                                      //   DatabaseReference ref = FirebaseDatabase
                                      //       .instance
                                      //       .ref()
                                      //       .child('order');
                                      //   await ref
                                      //       .child(widget.ordermodel.mainID)
                                      //       .remove();
                                      // } catch (e) {
                                      //   log(e.toString());
                                      // }

                                      // bloc.add(DeleteItemEvent());
                                    },
                                    btnName: 'Confirm Order',
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

// class OrderCartItem extends StatelessWidget {
//   const OrderCartItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.asset(
//                 'assets/images/skin_cream.png',
//                 width: 40.0,
//                 height: 60.0,
//                 fit: BoxFit.fitHeight,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Gentle Skin Cleanser',
//                     style: Theme.of(context).textTheme.headline4!.copyWith(
//                           color: CustomColors.ONSURFACE,
//                         ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '12.29 \$',
//                         style: Theme.of(context).textTheme.headline4!.copyWith(
//                               color: CustomColors.SECONDARY,
//                             ),
//                       ),
//                       const SizedBox(
//                         width: 20.0,
//                       ),
//                       Text(
//                         '300 ML',
//                         style: Theme.of(context).textTheme.headline4!.copyWith(
//                               color: CustomColors.SECONDARY,
//                             ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'x',
//                         style: Theme.of(context).textTheme.headline4!.copyWith(
//                               color: CustomColors.ONSURFACE,
//                             ),
//                       ),
//                       Text(
//                         '6',
//                         style: Theme.of(context).textTheme.headline3!.copyWith(
//                               color: CustomColors.ONSURFACE,
//                             ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Text(
//                 '120\$',
//                 style: Theme.of(context).textTheme.headline4!.copyWith(
//                       color: CustomColors.PRIMARY,
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
