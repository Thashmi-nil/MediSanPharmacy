import 'package:medisan/views/customer/cust_order_main/cust_place_order/cust_place_order_event.dart';
import 'package:medisan/views/customer/cust_order_main/cust_place_order/cust_place_order_state.dart';
import 'package:medisan/views/customer/cust_shopping_cart/cust_shopping_cart_event.dart';
import 'package:medisan/utilities/util_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../styles/color_palette.dart';
import '../../cust_home/cust_home_topbar.dart';
import '../../cust_shopping_cart/cust_shopping_cart_bloc.dart';
import 'cust_place_order_bloc.dart';

// PLACE ORDER VIEW
class CustomerPlaceOrderPageView extends StatefulWidget {
  const CustomerPlaceOrderPageView({Key? key}) : super(key: key);

  @override
  _CustomerPlaceOrderPageViewState createState() =>
      _CustomerPlaceOrderPageViewState();
}

class _CustomerPlaceOrderPageViewState
    extends State<CustomerPlaceOrderPageView> {
  @override
  Widget build(BuildContext context) {
    CustomerPlaceOrderPageBloc cusPlaceOrderBloc =
        BlocProvider.of<CustomerPlaceOrderPageBloc>(context);
    ShoppingCartPageBloc shoppingCartBloc =
        BlocProvider.of<ShoppingCartPageBloc>(context);
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
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text(''),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60.0,
              ),
              Center(
                child: Image.asset('assets/images/placeorder.png', height: 320),
              ),
              const SizedBox(
                height: 20.0,
              ),

              // IF THE STATE IS REGISTERING, DISPLAY PLACE ORDER BUTTON
              BlocBuilder<CustomerPlaceOrderPageBloc,
                  CustomerPlaceOrderPageState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading ||
                    previous.addName != current.addName,
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state.addName == 'registering') {
                    return InkWell(
                      // ADD THE ORDER WHEN PRESSING PLACE ORDER BUTTON
                      onTap: () {
                        cusPlaceOrderBloc.add(PlaceOrderEvent());
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: CustomColors.PRIMARY,
                        ),
                        child: Center(
                          child: Text(
                            'Place Order',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: CustomColors.BACKGROUND,
                                    fontSize: 20.0),
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 20.0,
              ),

              // IF THE STATE IS REGISTERED, DISPLAY BACK BUTTON
              BlocBuilder<CustomerPlaceOrderPageBloc,
                  CustomerPlaceOrderPageState>(
                buildWhen: (previous, current) =>
                    previous.addName != current.addName,
                builder: (context, state) {
                  if (state.addName == 'registered') {
                    return CustomNextButton(
                      backgound: CustomColors.SECONDARY,
                      btextColor: CustomColors.BACKGROUND,
                      tap: () {
                        cusPlaceOrderBloc.add(InitEvent()); // STATE CHANGE
                        shoppingCartBloc
                            .add(ClearCartEvent()); // CLEARE THE CART
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                const CustomerTabBarView()), // MOVE TO CUSTOMER TAB BAR VIEW
                          ),
                        );
                      },
                      btnName: 'Back',
                    );
                  }
                  return const Text('');
                },
              ),
              const SizedBox(height: 20.0),

              // IF THE STATE IS REGISTERED, DISPLAY EXIT BUTTON
              BlocBuilder<CustomerPlaceOrderPageBloc,
                  CustomerPlaceOrderPageState>(
                buildWhen: (previous, current) =>
                    previous.addName != current.addName,
                builder: (context, state) {
                  if (state.addName == 'registered') {
                    return CustomNextButton(
                      backgound: CustomColors.PRIMARY,
                      btextColor: CustomColors.BACKGROUND,
                      tap: () {
                        SystemNavigator.pop();
                      },
                      btnName: 'Exit',
                    );
                  }
                  return const Text('');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
