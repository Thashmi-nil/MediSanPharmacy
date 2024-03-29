import 'dart:developer';

import 'package:medisan/utilities/util_popup_btn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../models/product_model.dart';
import '../styles/color_palette.dart';
import '../views/owner/own_new_product/new_product_view.dart';
import '../views/customer/cust_item_search/all_item_search_provider.dart';
import '../views/customer/cust_product_main/cust_products/customer_product_list_page_bloc.dart';
import '../views/customer/cust_product_main/cust_products/customer_product_list_page_event.dart';
import 'util_update_btn.dart';

class CusProductCard extends StatefulWidget {
  final ProductModel productModel;
  final VoidCallback tap;
  final VoidCallback tapAddItem;
  final String mode;
  const CusProductCard({
    required this.tap,
    required this.tapAddItem,
    required this.productModel,
    this.mode = 'customer',
    Key? key,
  }) : super(key: key);

  @override
  State<CusProductCard> createState() => _CusProductCardState();
}

class _CusProductCardState extends State<CusProductCard> {
  int itemCount = 1;

  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameTextEditingController =
      TextEditingController();
  late TextEditingController priceTextEditingController =
      TextEditingController();
  late TextEditingController quantityTextEditingController =
      TextEditingController();
  late TextEditingController descriptionTextEditingController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    nameTextEditingController.text = widget.productModel.name;
    priceTextEditingController.text =
        widget.productModel.productPrice.toString();
    quantityTextEditingController.text =
        widget.productModel.productQuantity.toString();
    descriptionTextEditingController.text = widget.productModel.aboutProduct;
    log(widget.productModel.name);
  }

  @override
  Widget build(BuildContext context) {
    CustomerProductListPageBloc bloc =
        BlocProvider.of<CustomerProductListPageBloc>(context);
    return Container(
      width: double.infinity,
      height: 116.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: CustomColors.SCAFFOLD,
          border: Border.all(
            color: CustomColors.ONSURFACE,
          )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            InkWell(
              onTap: widget.tap,
              child: Image.network(
                widget.productModel.imageUrl,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 170.0,
                  child: Text(
                    widget.productModel.name,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: CustomColors.SECONDARY,
                        ),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
                Text(
                  'Rs. ${widget.productModel.productPrice}',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: CustomColors.PRIMARY,
                      ),
                ),
                // SizedBox(
                //   width: 140.0,
                //   child: Text(
                //     'The best place to buy medisan products in Sri Lanka',
                //     style: Theme.of(context).textTheme.headline5!.copyWith(
                //           color: CustomColors.SECONDARY,
                //         ),
                //   ),
                // ),
                widget.mode == 'customer'
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            itemCount -= 1;
                            if (itemCount <= 0) {
                              itemCount = 0;
                            }
                          });
                          bloc.add(AddItemCountEvent(itemCount: itemCount));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/down_btn.png',
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '$itemCount',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.SECONDARY,
                                  ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  itemCount += 1;
                                });
                                bloc.add(
                                    AddItemCountEvent(itemCount: itemCount));
                              },
                              child: Image.asset(
                                'assets/icons/up_btn.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Text(
                //   'Rs. ${widget.productModel.productPrice}',
                //   style: Theme.of(context).textTheme.headline4!.copyWith(
                //         color: CustomColors.PRIMARY,
                //       ),
                // ),

                // UPDATE MODEL
                widget.mode == 'customer'
                    ? InkWell(
                        onTap: widget.tapAddItem,
                        child: Container(
                          width: 50.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: CustomColors.PRIMARY,
                          ),
                          child: Center(
                            child: Text(
                              'Add',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    color: CustomColors.BACKGROUND,
                                  ),
                            ),
                          ),
                        ),
                      )
                    :
                    // UPDATE MODEL
                    Row(
                        children: [
                          SingleChildScrollView(
                            child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SingleChildScrollView(
                                          child: Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            elevation: 16,
                                            child: Container(
                                              width: 350.0,
                                              height: 480,
                                              // height: MediaQuery.of(context)
                                              //         .size
                                              //         .height *
                                              //     0.8,
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
                                                    Form(
                                                      key: _formKey,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Update',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline4!
                                                                .copyWith(
                                                                  color: CustomColors
                                                                      .PRIMARY,
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          LineInputField(
                                                            hintText: 'Name',
                                                            maxLength: 50,
                                                            validator:
                                                                RequiredValidator(
                                                                    errorText:
                                                                        'Item name is required'),
                                                            controller:
                                                                nameTextEditingController,
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          LineInputField(
                                                            hintText:
                                                                'Product Price',
                                                            maxLength: 10,
                                                            keyBoardType:
                                                                'number',
                                                            validator:
                                                                RequiredValidator(
                                                                    errorText:
                                                                        'Price is required'),
                                                            controller:
                                                                priceTextEditingController,
                                                          ),
                                                          LineInputField(
                                                            hintText:
                                                                'Quantity',
                                                            maxLength: 20,
                                                            keyBoardType:
                                                                'number',
                                                            validator:
                                                                RequiredValidator(
                                                                    errorText:
                                                                        'Quantity is required'),
                                                            controller:
                                                                quantityTextEditingController,
                                                          ),
                                                          LineInputField(
                                                            hintText:
                                                                'About Product',
                                                            maxLength: 2000,
                                                            validator:
                                                                RequiredValidator(
                                                                    errorText:
                                                                        'About Product is required'),
                                                            controller:
                                                                descriptionTextEditingController,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        CustomUpdateButton(
                                                          tap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          isUpdated: false,
                                                        ),
                                                        const SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        CustomUpdateButton(
                                                          tap: () async {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              try {
                                                                var collection =
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'products');
                                                                collection
                                                                    .doc(widget
                                                                        .productModel
                                                                        .docID)
                                                                    .update({
                                                                      'name': nameTextEditingController
                                                                          .text
                                                                          .trim(),
                                                                      "productPrice": double.parse(priceTextEditingController
                                                                          .text
                                                                          .trim()),
                                                                      "productQuantity": double.parse(quantityTextEditingController
                                                                          .text
                                                                          .trim()),
                                                                      "aboutProduct": descriptionTextEditingController
                                                                          .text
                                                                          .trim()
                                                                    }) // <-- Updated data
                                                                    .then((_) =>
                                                                        print(
                                                                            'Success'))
                                                                    .catchError(
                                                                        (error) =>
                                                                            print('Failed: $error'));
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        ((context) =>
                                                                            AllItemSearchPageProvider(
                                                                              productType: "ALL",
                                                                              mode: 'admin',
                                                                            )),
                                                                  ),
                                                                );
                                                              } catch (e) {
                                                                return Future
                                                                    .error(e
                                                                        .toString());
                                                              }
                                                            }
                                                          },
                                                          isUpdated: true,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: CustomColors.ERROR,
                                )),
                          ),

                          // FOR OWNER - DELETE MODEL
                          // InkWell(
                          //   onTap: () async {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return Dialog(
                          //           shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(40)),
                          //           elevation: 16,
                          //           child: Container(
                          //             width: 330.0,
                          //             height: 170.0,
                          //             decoration: BoxDecoration(
                          //               borderRadius:
                          //                   BorderRadius.circular(15.0),
                          //               color: CustomColors.BACKGROUND,
                          //             ),
                          //             child: Padding(
                          //               padding: const EdgeInsets.all(10.0),
                          //               child: Column(
                          //                 children: [
                          //                   Text(
                          //                     'Confirm',
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .headline4!
                          //                         .copyWith(
                          //                           color: CustomColors.ERROR,
                          //                           fontSize: 18.0,
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 24.0,
                          //                   ),
                          //                   Text(
                          //                     'Do you want to delete this item?',
                          //                     style: Theme.of(context)
                          //                         .textTheme
                          //                         .headline4!
                          //                         .copyWith(
                          //                           color:
                          //                               CustomColors.SECONDARY,
                          //                           fontSize: 18.0,
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                   ),
                          //                   const SizedBox(
                          //                     height: 10.0,
                          //                   ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     children: [
                          //                       PopupModelButton(
                          //                           isDeteled: false,
                          //                           tap: () {
                          //                             Navigator.of(context)
                          //                                 .pop();
                          //                           }),
                          //                       PopupModelButton(
                          //                           isDeteled: true,
                          //                           tap: () async {
                          //                             try {
                          //                               final collection =
                          //                                   FirebaseFirestore
                          //                                       .instance
                          //                                       .collection(
                          //                                           'products');
                          //                               await collection
                          //                                   .doc(widget
                          //                                       .productModel
                          //                                       .docID)
                          //                                   .delete()
                          //                                   .then((_) => print(
                          //                                       'Deleted'))
                          //                                   .catchError(
                          //                                       (error) => print(
                          //                                           'Delete failed: $error'));
                          //                               Navigator.of(context)
                          //                                   .push(
                          //                                 MaterialPageRoute(
                          //                                   builder: ((context) =>
                          //                                       AllItemSearchPageProvider(
                          //                                         productType:
                          //                                             "ALL",
                          //                                         mode: 'admin',
                          //                                       )),
                          //                                 ),
                          //                               );
                          //                             } catch (e) {
                          //                               Future.error(
                          //                                   e.toString());
                          //                             }
                          //                           }),
                          //                     ],
                          //                   )
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          //   child: const Icon(
                          //     Icons.delete_outline_outlined,
                          //     color: CustomColors.ERROR,
                          //   ),
                          // ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
