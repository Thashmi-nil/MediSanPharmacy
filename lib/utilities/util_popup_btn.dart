import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../styles/color_palette.dart';

class PopupWindowButton extends StatelessWidget {
  final VoidCallback tap;
  final bool isDeteled;
  const PopupWindowButton({
    required this.tap,
    this.isDeteled = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 120.0,
        child: InkWell(
          onTap: tap,
          child: isDeteled
              ? Container(
                  width: 120.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: CustomColors.PRIMARY,
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: CustomColors.BACKGROUND,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                )
              : Container(
                  width: 120.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColors.SECONDARY,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                    color: CustomColors.BACKGROUND,
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: CustomColors.PRIMARY,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
        ));
  }
}
