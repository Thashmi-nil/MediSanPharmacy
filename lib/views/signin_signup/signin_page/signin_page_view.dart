import 'package:medisan/views/initials/page_two.dart';
import 'package:medisan/views/signin_signup/signin_page/signin_page_event.dart';
import 'package:medisan/views/signin_signup/signin_page/signin_page_state.dart';
import 'package:medisan/views/signin_signup/signup_page/signup_page_provider.dart';
import 'package:medisan/utilities/util_circ_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import '../../../utilities/util_sign_appbar.dart';
import '../../../utilities/util_input_field.dart';
import '../../../utilities/util_next_btn.dart';
import 'signin_page_bloc.dart';
import '../../../utilities/util_btn_two.dart';

class SignINPageView extends StatefulWidget {
  const SignINPageView({Key? key}) : super(key: key);

  @override
  _SignINPageViewState createState() => _SignINPageViewState();
}

class _SignINPageViewState extends State<SignINPageView> {
  final _formKey = GlobalKey<FormState>();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'email is required'),
    EmailValidator(errorText: "Email is required"),
  ]);
  @override
  Widget build(BuildContext context) {
    SignINPageBloc bloc = BlocProvider.of<SignINPageBloc>(context);
    var body = Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              Center(
                child: Image.asset(
                  'assets/icons/medisanLogo.png',
                  width: 100.0,
                  height: 50.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                'Welcome To MediSan !',
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 80.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LabelInputFeild(
                      controller: bloc.emailTextEditingController,
                      hintText: 'Username',
                      validator: emailValidator,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    LabelInputFeild(
                      isPasswordField: true,
                      isObscureText: true,
                      controller: bloc.passwordTextEditingController,
                      hintText: 'Password',
                      isSufixIcon: true,
                      validator: passwordValidator,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              CustomNextButton(
                tap: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.add(
                      UserLoginEvent(
                        email: bloc.emailTextEditingController.text.trim(),
                        password:
                            bloc.passwordTextEditingController.text.trim(),
                      ),
                    );
                  }
                },
                btnName: 'Log in',
              ),
              const SizedBox(
                height: 20.0,
              ),
              ButtonTwo(
                btnName: 'Back',
                tap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => PageTwo()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );

    return BlocBuilder<SignINPageBloc, SignINPageState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return CustomCircularProgressIndicator(body: body);
        }
        return body;
      },
    );
  }
}
