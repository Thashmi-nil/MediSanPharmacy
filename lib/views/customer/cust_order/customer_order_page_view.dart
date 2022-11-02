import 'dart:developer';
import 'package:medisan/models/order_model.dart';
import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/customer/cust_order_details/customer_order_details_page_provider.dart';
import 'package:medisan/views/customer/cust_order/customer_order_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cust_home/cust_home_topbar.dart';
import 'customer_order_page_bloc.dart';

class CustomerOrderPageView extends StatefulWidget {
  final String mode;
  final String role;
  const CustomerOrderPageView(
      {this.role = 'customer', this.mode = 'Tabbar', Key? key})
      : super(key: key);

  @override
  _CustomerOrderPageViewState createState() => _CustomerOrderPageViewState();
}

class _CustomerOrderPageViewState extends State<CustomerOrderPageView> {
  @override
  Widget build(BuildContext context) {
    CustomerOrderPageBloc bloc =
        BlocProvider.of<CustomerOrderPageBloc>(context);
    return Scaffold(
        backgroundColor: CustomColors.SCAFFOLD,
        appBar: widget.mode == 'Tabbar'
            ? PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Container(
                  width: double.infinity,
                  height: 90.0,
                  color: CustomColors.PRIMARY,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'My Orders',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: CustomColors.BACKGROUND,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ))
            : PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, right: 20.0, left: 20.0),
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
                            child: const Icon(Icons.arrow_back),
                          ),
                          Image.asset(
                            'assets/icons/logo_icon.png',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      const CustomerTabBarView()),
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
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'My Orders',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: CustomColors.SECONDARY,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
        body: widget.role == 'admin'
            ? BlocBuilder<CustomerOrderPageBloc, CustomerOrderPageState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading ||
                    previous.adminOrders != current.adminOrders,
                builder: (context, state) {
                  log(state.adminOrders.length.toString());
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state.adminOrders.isEmpty) {
                    return Center(
                      child: Center(
                        child: Text(
                          'No orders, start to shopping!',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: CustomColors.SECONDARY,
                                  ),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.adminOrders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 20.0,
                          bottom: 20.0,
                          top: 10.0,
                        ),
                        child: DisplayOrderCard(
                          orderModel: state.adminOrders[index],
                          widget: widget,
                        ),
                      );
                    },
                  );
                },
              )
            : BlocBuilder<CustomerOrderPageBloc, CustomerOrderPageState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading ||
                    previous.orders != current.orders,
                builder: (context, state) {
                  log(state.orders.length.toString());
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state.orders.isEmpty) {
                    return Center(
                      child: Center(
                        child: Text(
                          'No orders, start to shopping!',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: CustomColors.SECONDARY,
                                  ),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                          left: 20.0,
                          bottom: 20.0,
                          top: 10.0,
                        ),
                        child: DisplayOrderCard(
                          orderModel: state.orders[index],
                          widget: widget,
                        ),
                      );
                    },
                  );
                },
              ));
  }
}

class DisplayOrderCard extends StatelessWidget {
  final OrderModel orderModel;
  const DisplayOrderCard({
    Key? key,
    required this.widget,
    required this.orderModel,
  }) : super(key: key);

  final CustomerOrderPageView widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => CustomerOrderDetailsPageProvider(
                role: widget.role, ordermodel: orderModel)),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.BACKGROUND,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: CustomColors.BACKGROUND,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icons/icons8-add-shopping-cart-80.png'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tatal Amount',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 16.0,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${double.parse(orderModel.total).toStringAsFixed(2)} \$',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.PRIMARY,
                                    fontSize: 18.0,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Tatal Items',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 16.0,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${orderModel.products.length}',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.PRIMARY,
                                    fontSize: 18.0,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Order ID',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 16.0,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 120.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              orderModel.orderId,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Order At',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: CustomColors.ONSURFACE,
                                    fontSize: 16.0,
                                  ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        SizedBox(
                          width: 120.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              orderModel.date,
                              overflow: TextOverflow.fade,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                    fontSize: 14.0,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(),
                        const SizedBox(
                          width: 80.0,
                        ),
                        Container(
                          width: 120.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: CustomColors.PRIMARY,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'View Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: CustomColors.PRIMARY,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderCartItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String quantity;
  final int count;
  const OrderCartItem(
      {required this.imageUrl,
      required this.name,
      required this.count,
      required this.price,
      required this.quantity,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                width: 40.0,
                height: 60.0,
                fit: BoxFit.fitHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.ONSURFACE,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$price \$',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: CustomColors.SECONDARY,
                            ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        '$quantity ML',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: CustomColors.SECONDARY,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'x',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: CustomColors.ONSURFACE,
                            ),
                      ),
                      Text(
                        count.toString(),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              color: CustomColors.ONSURFACE,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '${price * count}\$',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: CustomColors.PRIMARY,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
