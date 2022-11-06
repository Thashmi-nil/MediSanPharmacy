import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/owner/own_home/own_topbar.dart';
import 'package:medisan/utilities/util_next_btn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/order_model.dart';
import '../../../../utilities/util_popup_ok_btn.dart';
import 'cust_order_details_bloc.dart';
import '../../../../styles/color_palette.dart';
import '../../../../views/customer/cust_home/cust_home_topbar.dart';

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
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.BACKGROUND,
                        border: Border.all(
                          color: CustomColors.PRIMARY,
                        )),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.PRIMARY,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          color: CustomColors.SECONDARY,
                                          fontSize: 16.0,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order ID',
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
                                        widget.ordermodel.orderId,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Text(
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
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              // const Divider(),
                            ]))),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: CustomColors.BACKGROUND,
                      border: Border.all(
                        color: CustomColors.PRIMARY,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Details',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: CustomColors.PRIMARY,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              widget.ordermodel.phoneNumber,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text(
                              '${widget.ordermodel.address} ${widget.ordermodel.addressLineCity}',
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: CustomColors.BACKGROUND,
                        border: Border.all(
                          color: CustomColors.PRIMARY,
                        )),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.PRIMARY,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: CustomColors.BACKGROUND),

                                // LIST VIEW FOR ALL ITEMS IN THE ORDER
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: widget.ordermodel.products.length,
                                  itemBuilder: ((context, index) {
                                    return Column(
                                      children: [
                                        OrderCartItem(
                                          count: widget.ordermodel
                                              .products[index]['count'],
                                          productPrice:
                                              widget.ordermodel.products[index]
                                                  ['product']['productPrice'],
                                          productQuantity: widget
                                              .ordermodel
                                              .products[index]['product']
                                                  ['productQuantity']
                                              .toString(),
                                          imageUrl:
                                              widget.ordermodel.products[index]
                                                  ['product']['imageUrl'],
                                          name:
                                              widget.ordermodel.products[index]
                                                  ['product']['name'],
                                        ),
                                        const Divider(),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                              const Divider(),
                            ]))),

                // FOR OWNER TO ACCEPT ORDER
                widget.role == 'admin'
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 25.0,
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Confirm',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                    color:
                                                        CustomColors.SECONDARY,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
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
                                                    color:
                                                        CustomColors.SECONDARY,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
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
                                                    Navigator.of(context).pop();
                                                  },
                                                  isProceed: false,
                                                ),
                                                CustomPopupProceedButton(
                                                  tap: () async {
                                                    try {
                                                      DatabaseReference ref =
                                                          FirebaseDatabase
                                                              .instance
                                                              .ref()
                                                              .child('order');
                                                      await ref
                                                          .child(widget
                                                              .ordermodel
                                                              .mainOrderID)
                                                          .remove();
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: ((context) =>
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
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            btnName: 'Confirm Order',
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ));
  }
}

// APP BAR FOR MY ORDER DETAILS
class CustomMainApp extends StatelessWidget {
  const CustomMainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const CustomerTabBarView()),
                    ),
                  );
                },
                child: const Icon(
                  Icons.close,
                  color: CustomColors.SECONDARY,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'My Order Details',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: CustomColors.SECONDARY,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

// ORDERED ITEMS IN MY ORDER DETAILS
class OrderCartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double productPrice;
  final String productQuantity;
  final int count;
  const OrderCartItem(
      {required this.imageUrl,
      required this.name,
      required this.count,
      required this.productPrice,
      required this.productQuantity,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                width: 40.0,
                height: 60.0,
                fit: BoxFit.fitHeight,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Medicine Name',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: CustomColors.SECONDARY,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: CustomColors.SECONDARY,
                          ),
                    ),
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: CustomColors.SECONDARY,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  '$productPrice \$',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: CustomColors.SECONDARY,
                      ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '$productQuantity ML',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Count',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'x',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.ONSURFACE,
                        ),
                  ),
                  Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.ONSURFACE,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${productPrice * count}\$',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.ERROR,
                        ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
