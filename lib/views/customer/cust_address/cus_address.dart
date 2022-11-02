import 'package:medisan/views/customer/cust_address/cust_address_event.dart';
import 'package:medisan/views/customer/cust_address/cust_address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../styles/color_palette.dart';
import '../../../utilities/util_align_btn.dart';
import '../../../utilities/util_input_field.dart';
import 'cus_address_bloc.dart';

class CustomerAddAddressPageView extends StatefulWidget {
  const CustomerAddAddressPageView({Key? key}) : super(key: key);

  @override
  _CustomerAddAddressPageViewState createState() =>
      _CustomerAddAddressPageViewState();
}

class _CustomerAddAddressPageViewState
    extends State<CustomerAddAddressPageView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CustomerAddAddressPageBloc bloc =
        BlocProvider.of<CustomerAddAddressPageBloc>(context);
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
                child: const Icon(Icons.arrow_back),
              ),
              Image.asset(
                'assets/icons/logo_icon.png',
              ),
              const Icon(
                Icons.close,
                color: CustomColors.SECONDARY,
              ),
            ],
          ),
        ),
      ),
      body:
          BlocBuilder<CustomerAddAddressPageBloc, CustomerAddAddressPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Address',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: CustomColors.SECONDARY,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        LabelInputFeild(
                          controller: bloc.nameTextEditingController,
                          hintText: 'Name',
                          validator:
                              RequiredValidator(errorText: 'Name is required'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        LabelInputFeild(
                          controller: bloc.addressLineOneTextEditingController,
                          hintText: 'Address (line 1)',
                          validator: RequiredValidator(
                              errorText: 'Address (line 1) is required'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        LabelInputFeild(
                          controller: bloc.cityTextEditingController,
                          hintText: 'City',
                          validator:
                              RequiredValidator(errorText: 'City is required'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        LabelInputFeild(
                          controller: bloc.postalCodeTextEditingController,
                          hintText: 'Postal code',
                          validator: RequiredValidator(
                              errorText: 'Postal code is required'),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        LabelInputFeild(
                          keyboardType: 'number',
                          controller: bloc.phoneTextEditingController,
                          hintText: 'Phone number',
                          validator: RequiredValidator(
                              errorText: 'Phone number is required'),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomAlignButton(
          title: 'Done',
          tap: () {
            if (_formKey.currentState!.validate()) {
              bloc.add(
                AddAddressEvent(
                  addressLineOne:
                      bloc.addressLineOneTextEditingController.text.trim(),
                  city: bloc.cityTextEditingController.text.trim(),
                  name: bloc.nameTextEditingController.text.trim(),
                  phone: bloc.phoneTextEditingController.text.trim(),
                  postalCode: bloc.postalCodeTextEditingController.text.trim(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
