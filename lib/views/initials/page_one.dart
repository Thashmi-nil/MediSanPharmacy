import 'package:medisan/views/initials/page_two.dart';
import 'package:flutter/material.dart';
import '../../utilities/util_next_btn.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Image.asset(
                  'assets/icons/medisanLogo.png',
                  width: 100.0,
                  height: 50.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                'assets/icons/eShopping.png',
                width: 240.0,
                height: 180.0,
              ),
              Text(
                'On our way to healing your day!',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              Text(
                '24/7/365 Ordering',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              Text(
                'Deliver On Time',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Image.asset(
              //   'assets/icons/start_dot.png',
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              CustomNextButton(
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const PageTwo()),
                    ),
                  );
                },
              ),
              // ButtonTwo(
              //   tap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: ((context) => const PageTwo()),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomLine(),
    );
  }
}
