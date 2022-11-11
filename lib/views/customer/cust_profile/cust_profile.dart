import 'package:medisan/styles/color_palette.dart';
// import 'package:medisan/views/customer/cust_help/customer_help_page_provider.dart';
import 'package:medisan/views/customer/cust_profile/cust_profile_event.dart';
import 'package:medisan/views/customer/cust_profile/cust_profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../utilities/util_input_field.dart';
import '../../initials/page_two.dart';
import '../cust_item_search/all_item_search_provider.dart';
import '../cust_order_main/cust_order/cust_order_provider.dart';

import 'cust_profile_bloc.dart';

class CustomerProfilePageView extends StatefulWidget {
  const CustomerProfilePageView({Key? key}) : super(key: key);

  @override
  _CustomerProfilePageViewState createState() =>
      _CustomerProfilePageViewState();
}

class _CustomerProfilePageViewState extends State<CustomerProfilePageView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // CustomerProfilePageBloc bloc =
    //     BlocProvider.of<CustomerProfilePageBloc>(context);
    return Scaffold(
      // CUSTOMER PROFILE APPBAR
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
              const Text('My Account')
            ],
          ),
        ),
      ),
      body: BlocBuilder<CustomerProfilePageBloc, CustomerProfilePageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Container(
                        height: 180,
                      ),
                      Positioned(
                        child: Container(
                          height: 180.0,
                          // color: CustomColors.PRIMARY,
                        ),
                      ),

                      // CUSTOMER IMAGE AND EMAIL
                      Positioned(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              const CircleAvatar(
                                radius: 40.0,
                                backgroundImage: AssetImage(
                                  'assets/images/customer.jpg',
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                state.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: CustomColors.PRIMARY,
                                    ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 600.0,
                  child: ListView(
                    children: ListTile.divideTiles(context: context, tiles: [
                      // CUSTOMER ORDERS VIEW
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => CustomerOrderPageProvider(
                                    mode: 'normal',
                                    role: 'customer',
                                  )),
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.shopping_bag_outlined,
                          color: CustomColors.PRIMARY,
                        ),
                        title: const Text('My Orders'),
                      ),
                      // const Divider(),
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: ((context) => AllItemSearchPageProvider(
                      //               productType: "ALL",
                      //             )),
                      //       ),
                      //     );
                      //   },
                      //   leading: const Icon(
                      //     Icons.list_alt_rounded,
                      //     color: CustomColors.PRIMARY,
                      //   ),
                      //   title: const Text('Items'),
                      // ),
                      // ListTile(
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return Dialog(
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(40)),
                      //           elevation: 16,
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //                 color: CustomColors.SURFACE,
                      //                 borderRadius:
                      //                     BorderRadius.circular(10.0)),
                      //             width: 350.0,
                      //             height: 265.0,
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Container(
                      //                   height: 265.0,
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius:
                      //                         BorderRadius.circular(15.0),
                      //                   ),
                      //                   child: Padding(
                      //                       padding: const EdgeInsets.all(10.0),
                      //                       child: Column(
                      //                         children: [
                      //                           Text(
                      //                             'Add Feedback',
                      //                             style: Theme.of(context)
                      //                                 .textTheme
                      //                                 .headline4!
                      //                                 .copyWith(
                      //                                   fontSize: 24.0,
                      //                                 ),
                      //                           ),
                      //                           const SizedBox(
                      //                             height: 20.0,
                      //                           ),
                      //                           Form(
                      //                             key: _formKey,
                      //                             child: LabelInputFeild(
                      //                               maxLength: 2000,
                      //                               maxLines: 5,
                      //                               hintText:
                      //                                   'add yor feedback',
                      //                               controller: bloc
                      //                                   .textEditingController,
                      //                               validator: RequiredValidator(
                      //                                   errorText:
                      //                                       'Feedback is required'),
                      //                             ),
                      //                           ),
                      //                           const SizedBox(
                      //                             height: 10.0,
                      //                           ),
                      //                           InkWell(
                      //                             onTap: () {
                      //                               if (_formKey.currentState!
                      //                                   .validate()) {
                      //                                 bloc.add(
                      //                                   AddFeedBackEvent(
                      //                                     feedback: bloc
                      //                                         .textEditingController
                      //                                         .text
                      //                                         .trim(),
                      //                                   ),
                      //                                 );
                      //                                 Navigator.of(context)
                      //                                     .pop();
                      //                               }
                      //                             },
                      //                             child: Container(
                      //                               height: 42.0,
                      //                               width: 300.0,
                      //                               decoration: BoxDecoration(
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(
                      //                                         15.0),
                      //                                 color:
                      //                                     CustomColors.PRIMARY,
                      //                               ),
                      //                               child: Center(
                      //                                 child: Text(
                      //                                   'Post',
                      //                                   style: Theme.of(context)
                      //                                       .textTheme
                      //                                       .headline4!
                      //                                       .copyWith(
                      //                                         fontSize: 24.0,
                      //                                         color: CustomColors
                      //                                             .BACKGROUND,
                      //                                       ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       )),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     );
                      //   },
                      //   leading: const Icon(
                      //     Icons.bookmark_added_outlined,
                      //     color: CustomColors.PRIMARY,
                      //   ),
                      //   title: const Text('Feedbacks'),
                      // ),
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: ((context) =>
                      //             CustomerHelpPageProvider()),
                      //       ),
                      //     );
                      //   },
                      //   leading: const Icon(
                      //     Icons.help,
                      //     color: CustomColors.PRIMARY,
                      //   ),
                      //   title: const Text('Help'),
                      // ),

                      //SIGN OUT
                      ListTile(
                        onTap: () {
                          FirebaseAuth.instance.signOut().then(
                                (value) => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => const PageTwo()),
                                  ),
                                ),
                              );
                        },
                        leading: const Icon(
                          Icons.logout_rounded,
                          color: CustomColors.ERROR,
                        ),
                        title: const Text(
                          'Log Out',
                          style: TextStyle(
                              color: CustomColors.ERROR,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]).toList(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
