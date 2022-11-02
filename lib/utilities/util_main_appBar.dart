import 'package:flutter/material.dart';

import '../styles/color_palette.dart';
import '../views/customer/cust_home/cust_home_topbar.dart';

class CustomMainApp extends StatelessWidget {
  const CustomMainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const CustomerTabBarView()),
                    ),
                  );
                },
                child: const Icon(
                  Icons.close,
                  color: CustomColors.SECONDARY,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'Order Details',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: CustomColors.SECONDARY,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
