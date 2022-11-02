import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_page_bloc.dart';
import 'signup_page_view.dart';

class SignupPageProvider extends BlocProvider<SignupPageBloc> {
  SignupPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => SignupPageBloc(context),
          child: const SignupPageView(),
        );
}
