import 'package:flutter/material.dart';
import '../styles/color_palette.dart';

class CustomNextButton extends StatelessWidget {
  final VoidCallback tap;
  final String btnName;
  final Color backgound;
  final Color btextColor;
  const CustomNextButton({
    Key? key,
    required this.tap,
    this.btnName = 'Next',
    this.backgound = CustomColors.PRIMARY,
    this.btextColor = CustomColors.BACKGROUND,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        width: double.infinity,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: backgound,
        ),
        child: Center(
          child: Text(
            btnName,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: btextColor, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
