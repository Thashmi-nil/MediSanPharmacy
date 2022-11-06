import 'package:flutter/material.dart';
import '../styles/color_palette.dart';

class CustomUpdateButton extends StatelessWidget {
  final VoidCallback tap;
  final String btnName;
  final bool isUpdated;
  const CustomUpdateButton({
    Key? key,
    required this.tap,
    this.btnName = 'Update',
    this.isUpdated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isUpdated == true
        ? InkWell(
            onTap: tap,
            child: Container(
              height: 40.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: CustomColors.PRIMARY,
              ),
              child: Center(
                child: Text(
                  'Update',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: CustomColors.BACKGROUND, fontSize: 20.0),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: tap,
            child: Container(
              height: 40.0,
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: CustomColors.BACKGROUND,
                  border: Border.all(
                    color: CustomColors.PRIMARY,
                  )),
              child: Center(
                child: Text(
                  'Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: CustomColors.PRIMARY, fontSize: 20.0),
                ),
              ),
            ),
          );
  }
}
