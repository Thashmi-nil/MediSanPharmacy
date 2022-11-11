import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/owner/own_new_product/new_product_event.dart';
import 'package:medisan/views/owner/own_new_product/new_product_state.dart';
import 'package:medisan/views/owner/own_new_product/get_category/get_category_bloc.dart';
import 'package:medisan/utilities/util_circ_progress.dart';
import 'package:medisan/utilities/util_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'new_product_bloc.dart';

// ADD A NEW PRODUCT VIEW
class AddProductPageView extends StatefulWidget {
  const AddProductPageView({Key? key}) : super(key: key);

  @override
  _AddProductPageViewState createState() => _AddProductPageViewState();
}

class _AddProductPageViewState extends State<AddProductPageView> {
  var currentSelectedValue;

  // PRODUCT TYPES
  List<String> productType = [
    "medicine",
    "healthcare",
    "labTests",
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddProductPageBloc bloc = BlocProvider.of<AddProductPageBloc>(context);
    var body = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<AddProductPageBloc, AddProductPageState>(
              buildWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                if (state.isLoading) {
                  const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: CustomColors.PRIMARY,
                    ),
                  );
                }
                return state.imageUrl.isEmpty
                    ? InkWell(
                        onTap: () {
                          bloc.add(UploadImageEvent());
                        },
                        child: Container(
                          // IMAGE PICKER
                          child: const Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: CustomColors.PRIMARY,
                              size: 150.0,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            state.imageUrl,
                            width: 100.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LineInputField(
                      hintText: 'Name',
                      maxLength: 50,
                      validator:
                          RequiredValidator(errorText: 'Item name is required'),
                      controller: bloc.nameTextEditingController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Product Type',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.start,
                    ),

                    // PRODUCT TYPES IN THE DROPDOWN LIST
                    BlocBuilder<GetCategoryBloc, GetCategoryState>(
                      builder: (context, state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 0.012),
                            hintText: '',
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.fromLTRB(1, 2, 0, 0),
                            hintStyle: Theme.of(context).textTheme.subtitle1,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: CustomColors.PRIMARY, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: Text(
                                '',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              value: currentSelectedValue,
                              isDense: true,
                              isExpanded: true,

                              /// SET THE CHANGED VALUE
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    currentSelectedValue = newValue!;
                                    context.read<GetCategoryBloc>().add(
                                        GetMyCategoryEvent(
                                            currentSelectedValue));
                                  },
                                );
                              },

                              // SET DROPDOWN VALUES
                              items: productType.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    LineInputField(
                      hintText: 'Price',
                      maxLength: 10,
                      keyBoardType: 'number',
                      validator:
                          RequiredValidator(errorText: 'Price is required'),
                      controller: bloc.priceTextEditingController,
                    ),
                    LineInputField(
                      hintText: 'Quantity',
                      maxLength: 20,
                      keyBoardType: 'number',
                      validator:
                          RequiredValidator(errorText: 'Quantity is required'),
                      controller: bloc.quantityTextEditingController,
                    ),
                    LineInputField(
                      hintText: 'About Product',
                      maxLength: 2000,
                      validator: RequiredValidator(
                          errorText: 'About Product is required'),
                      controller: bloc.descriptionTextEditingController,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
    return Scaffold(
      // NEW ITEM PAGE TOP BAR
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            width: double.infinity,
            height: 90.0,
            color: CustomColors.PRIMARY,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'New Item',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: CustomColors.BACKGROUND,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
      body: BlocBuilder<AddProductPageBloc, AddProductPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return CustomCircularProgressIndicator(body: body);
          }
          // RETURN THE FORM
          return body;
        },
      ),

      // BUTTON AT THE FORM'S BOTTOM NAVIGATOR
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: BlocBuilder<GetCategoryBloc, GetCategoryState>(
            builder: (context, state) {
              return CustomNextButton(
                tap: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(
                      // SET THE FORM VARIABLES WHEN PRESSING THE ADD BUTTON
                      AddNewProductEvent(
                        productType: state.productType,
                        aboutProduct:
                            bloc.descriptionTextEditingController.text.trim(),
                        name: bloc.nameTextEditingController.text.trim(),
                        productPrice: double.parse(
                            bloc.priceTextEditingController.text.trim()),
                        productQuantity: double.parse(
                            bloc.quantityTextEditingController.text.trim()),
                        imageUrl: bloc.state.imageUrl,
                      ),
                    );
                  }
                },
                btnName: 'Add',
              );
            },
          )),
    );
  }
}

// INPUT FIELD WIDGET
class LineInputField extends StatelessWidget {
  final String hintText;
  final int maxLength;
  final TextEditingController controller;
  final FieldValidator validator;
  final String keyBoardType;

  const LineInputField({
    Key? key,
    this.keyBoardType = 'text',
    required this.controller,
    required this.hintText,
    required this.maxLength,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType:
          keyBoardType == 'text' ? TextInputType.text : TextInputType.phone,
      maxLength: maxLength,
      cursorColor: CustomColors.ONSURFACE,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 12),
        labelText: hintText,
        labelStyle: Theme.of(context).textTheme.headline3,
        hintText: '',
        hintStyle: Theme.of(context).textTheme.headline5,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
