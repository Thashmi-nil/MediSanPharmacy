import 'package:flutter/material.dart';

import '../styles/color_palette.dart';

class CustomAlignButton extends StatelessWidget {
  final VoidCallback tap;
  final String title;
  const CustomAlignButton({
    required this.tap,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: 200.0,
        height: 42.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: CustomColors.PRIMARY,
          border: Border.all(
            color: CustomColors.SECONDARY,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: CustomColors.BACKGROUND,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
