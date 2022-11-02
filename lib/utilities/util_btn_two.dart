import 'package:flutter/material.dart';
import '../styles/color_palette.dart';

class ButtonTwo extends StatelessWidget {
  final VoidCallback tap;
  final String btnName;

  const ButtonTwo({Key? key, required this.tap, this.btnName = 'Skip'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: SizedBox(
        width: double.infinity,
        height: 48.0,
        child: Center(
          child: Text(
            btnName,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: CustomColors.ONSURFACE,
                ),
          ),
        ),
      ),
    );
  }
}
