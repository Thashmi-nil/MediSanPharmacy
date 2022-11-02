import 'package:medisan/styles/color_palette.dart';
import 'package:medisan/views/signin_signup/signin_page/signin_page_provider.dart';
import 'package:medisan/views/signin_signup/signup_page/signup_page_provider.dart';
import 'package:flutter/material.dart';
import '../../utilities/util_next_btn.dart';
import '../../utilities/util_btn_two.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // Center(
            //   child: Image.asset(
            //     'assets/icons/logo_icon.png',
            //   ),
            // ),
            Image.asset(
              'assets/icons/medisanLogo.png',
              width: 100.0,
              height: 50.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'assets/icons/loginPage.png',
              width: 240.0,
              height: 180.0,
            ),

            Text(
              'MediSan',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                  // color: CustomColors.PRIMARY,
                  ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomNextButton(
              btnName: 'Login',
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignINPageProvider()),
                  ),
                );
              },
            ),
            ButtonTwo(
              btnName: 'Create New',
              tap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SignupPageProvider()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const CustomBottomLine(),
    );
  }
}
