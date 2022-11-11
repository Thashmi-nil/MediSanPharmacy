// ignore_for_file: use_build_context_synchronously

import 'package:medisan/views/customer/cust_address/cust_address_provider.dart';
import 'package:medisan/views/customer/cust_order_main/cust_place_order/cust_place_order_event.dart';
import 'package:medisan/views/customer/cust_order_main/cust_place_order/cust_place_order.dart';
import 'package:medisan/views/customer/cust_order_main/cust_select_address/cust_address_select_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../styles/color_palette.dart';
import '../../../../utilities/util_align_btn.dart';
import '../../../../utilities/util_popup_btn.dart';
import '../cust_place_order/cust_place_order_bloc.dart';
import 'cust_address_select_bloc.dart';
import 'cust_address_select_state.dart';

class CustomerSelectAddressPageView extends StatefulWidget {
  const CustomerSelectAddressPageView({Key? key}) : super(key: key);

  @override
  _CustomerSelectAddressPageViewState createState() =>
      _CustomerSelectAddressPageViewState();
}

class _CustomerSelectAddressPageViewState
    extends State<CustomerSelectAddressPageView> {
  @override
  Widget build(BuildContext context) {
    CustomerPlaceOrderPageBloc cusPlaceOrderBloc =
        BlocProvider.of<CustomerPlaceOrderPageBloc>(context);
    CustomerSelectAddressPageBloc bloc =
        BlocProvider.of<CustomerSelectAddressPageBloc>(context);
    return Scaffold(
      backgroundColor: CustomColors.SCAFFOLD,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Padding(
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
                  // Image.asset(
                  //   'assets/icons/logo_icon.png',
                  // ),
                  const Icon(
                    Icons.close,
                    color: CustomColors.SECONDARY,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                'Select Address',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: CustomColors.SECONDARY,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CustomerSelectAddressPageBloc,
          CustomerSelectAddressPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),

            // VIEW ALL THE AVAILABLE ADDRESSESS
            child: ListView.builder(
                itemCount: state.address.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CustomColors.BACKGROUND,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: CustomColors.PRIMARY,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            // NAME
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
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  state.address[index].name,
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
                              height: 10.0,
                            ),
                            // PHONE NUMBER
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  state.address[index].phoneNumber,
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
                              height: 10.0,
                            ),
                            // ADDERESS LINE 1
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address(line1)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                // const SizedBox(
                                //   width: 26.0,
                                // ),
                                // Expanded(
                                // child:
                                Text(
                                  state.address[index].addressLineOne,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            // ADDRESS LINE TWO
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Address(City)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: CustomColors.SECONDARY,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  state.address[index].addressLineCity,
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
                              height: 10.0,
                            ),

                            // DELETE ADDRESS MODEL
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          elevation: 16,
                                          child: Container(
                                            width: 330.0,
                                            height: 180.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: CustomColors.SECONDARY,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Delete',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .copyWith(
                                                          color: CustomColors
                                                              .BACKGROUND,
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  const SizedBox(
                                                    height: 24.0,
                                                  ),
                                                  Text(
                                                    'Do you want to delete the address?',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4!
                                                        .copyWith(
                                                          color: CustomColors
                                                              .BACKGROUND,
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
                                                      // POP OUT BY CANCEL BUTTON
                                                      PopupModelButton(
                                                        tap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        isDeteled: false,
                                                      ),

                                                      // DELETE CONFIRM BUTTON
                                                      PopupModelButton(
                                                        tap: () async {
                                                          try {
                                                            await FirebaseFirestore
                                                                // CREATE AN INTANCE OF ADDRESS TABLE
                                                                .instance
                                                                .collection(
                                                                    'address')
                                                                .doc(state
                                                                    .address[
                                                                        index]
                                                                    .addressId)
                                                                .delete(); // DELETE THE ADDRESS

                                                            // NAVIGATE TOTHE CUSTOMER SELECT ADDRESS PAGE
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    ((context) =>
                                                                        CustomerSelectAddressPageProvider()),
                                                              ),
                                                            );
                                                          } catch (e) {
                                                            Future.error(
                                                                e.toString());
                                                          }
                                                        },
                                                        isDeteled: true,
                                                      )
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
                                  child: const Icon(
                                    Icons.delete,
                                    color: CustomColors.ERROR,
                                  ),
                                ),
                                // CONFIRM BUTTON AND MOVE TO PLACE ORDER VIEW
                                InkWell(
                                  onTap: () {
                                    cusPlaceOrderBloc.add(LastAddAddressEvent(
                                        addressModel: state.address[index]));
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BlocProvider.value(
                                          value: cusPlaceOrderBloc,
                                          child:
                                              const CustomerPlaceOrderPageView(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 120.0,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: CustomColors.PRIMARY,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Confirm',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              color: CustomColors.BACKGROUND,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
          );
        },
      ),

      // ADD ADDRESS BUTTON IN BOTTOM NAV
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomAlignButton(
          title: 'Add Another Address',
          tap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => CustomerAddAddressPageProvider()),
              ),
            );
          },
        ),
      ),
    );
  }
}
