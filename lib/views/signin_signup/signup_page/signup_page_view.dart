import 'package:medisan/views/initials/page_two.dart';
import 'package:medisan/views/signin_signup/signup_page/signup_page_event.dart';
import 'package:medisan/views/signin_signup/signup_page/signup_page_state.dart';
import 'package:medisan/utilities/util_next_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import '../../../utilities/auth_page_appbar.dart';
import '../../../utilities/util_circ_progress.dart';
import '../../../utilities/util_input_field.dart';
import '../signin_page/signin_page_provider.dart';
import 'signup_page_bloc.dart';
import '../../../utilities/util_btn_two.dart';

class SignupPageView extends StatefulWidget {
  const SignupPageView({Key? key}) : super(key: key);

  @override
  _SignupPageViewState createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
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
    SignupPageBloc bloc = BlocProvider.of<SignupPageBloc>(context);
    var body = SingleChildScrollView(
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
              'Create New Account',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LabelInputFeild(
                    controller: bloc.nameTextEditingController,
                    hintText: 'Name',
                    validator: RequiredValidator(errorText: "Name is required"),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  LabelInputFeild(
                    controller: bloc.emailTextEditingController,
                    hintText: 'Email',
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
                    SubmitUserDataEvent(
                      name: bloc.nameTextEditingController.text.trim(),
                      email: bloc.emailTextEditingController.text.trim(),
                      password: bloc.passwordTextEditingController.text.trim(),
                    ),
                  );
                }
              },
              btnName: 'Sign up',
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
    );
    return Scaffold(
      body: BlocBuilder<SignupPageBloc, SignupPageState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return CustomCircularProgressIndicator(
              body: body,
            );
          }
          return body;
        },
      ),
    );
  }
}
