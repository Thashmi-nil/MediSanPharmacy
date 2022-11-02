import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../styles/color_palette.dart';

class LabelInputFeild extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final bool isSufixIcon;
  final bool isPasswordField;
  final FieldValidator validator;
  final TextEditingController controller;
  final String keyboardType;
  final int maxLength;
  final int maxLines;
  const LabelInputFeild(
      {Key? key,
      required this.hintText,
      this.isObscureText = true,
      required this.controller,
      this.isSufixIcon = false,
      this.isPasswordField = false,
      this.keyboardType = 'text',
      this.maxLength = 50,
      this.maxLines = 1,
      required this.validator})
      : super(key: key);

  @override
  State<LabelInputFeild> createState() => _LabelInputFeildState();
}

class _LabelInputFeildState extends State<LabelInputFeild> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      keyboardType: widget.keyboardType == 'text'
          ? TextInputType.text
          : TextInputType.phone,
      validator: widget.validator,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: widget.isSufixIcon
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: CustomColors.PRIMARY,
                ),
              )
            : const Text(''),
        errorStyle: const TextStyle(fontSize: 12.0),
        hintText: widget.hintText,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 28, 0, 0),
        hintStyle: Theme.of(context).textTheme.subtitle1,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: CustomColors.SECONDARY,
            style: BorderStyle.solid,
            width: 3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CustomColors.PRIMARY, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
