import 'package:medisan/models/product_model.dart';
import 'package:medisan/styles/color_palette.dart';
import 'package:flutter/material.dart';

class AdminProductDetailsPageView extends StatefulWidget {
  final ProductModel productModel;
  const AdminProductDetailsPageView({required this.productModel, Key? key})
      : super(key: key);

  @override
  _AdminProductDetailsPageViewState createState() =>
      _AdminProductDetailsPageViewState();
}

class _AdminProductDetailsPageViewState
    extends State<AdminProductDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Image.asset(
              //   'assets/icons/logo_icon.png',
              // ),
              // const Text('')
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // color: CustomColors.PRIMARY,
          // decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     CustomColors.DARKISH,
          //     CustomColors.PRIMARY,
          //   ],
          // ),
          // ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 260.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(15.0),
                        // bottomRight: Radius.circular(15.0),
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                            ]),
                        const SizedBox(
                          height: 20.0,
                        ),
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
                              'Rs: ${widget.productModel.productPrice}',
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
                          height: 30.0,
                        ),
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
                            Text(
                              '${widget.productModel.productQuantity} ',
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
                                '${widget.productModel.aboutProduct} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: CustomColors.ONSURFACE,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ])
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
