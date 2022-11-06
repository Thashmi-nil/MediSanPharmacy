// ignore_for_file: use_build_context_synchronously
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medisan/views/prescriptionChecker/pcheck_home/pcheck_home_topbar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../styles/color_palette.dart';
import '../../../styles/fonts.dart';
import '../../owner/own_home/own_topbar.dart';
import '../../customer/cust_home/cust_home_topbar.dart';
import 'signin_page_event.dart';
import 'signin_page_state.dart';

class SignINPageBloc extends Bloc<SignINPageEvent, SignINPageState> {
  late TextEditingController emailTextEditingController =
      TextEditingController();
  late TextEditingController passwordTextEditingController =
      TextEditingController();
  SignINPageBloc(BuildContext context) : super(SignINPageState.initialState) {
    on<UserLoginEvent>((event, emit) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        emit(state.clone(isLoading: true));
        await auth
            .signInWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((value) {
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              backgroundColor: CustomColors.PRIMARY_VARIANT,
              message: "Successfully  login",
              textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
            ),
          );
          emit(state.clone(isLoading: false));
        }).catchError((err) {
          // emit(state.clone(isLoading: false));
          emit(state.clone(isLoading: false));

          showTopSnackBar(
            context,
            const CustomSnackBar.error(
              backgroundColor: CustomColors.ERROR,
              message:
                  "Something went wrong. Please check your credentials and try again",
              textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
            ),
          );
        });
        if (auth.currentUser!.email == 'adminowner@gmail.com') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const AdminTabBarView()),
            ),
          );
        } else if (auth.currentUser!.email == 'checker@gmail.com') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const PCheckerTabBarView()),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const CustomerTabBarView()),
            ),
          );
        }
      } catch (e) {
        emit(state.clone(isLoading: false));

        return Future.error(e.toString());
      }
    });
  }
}
