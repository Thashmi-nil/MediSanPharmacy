// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:medisan/views/signin_signup/signin_page/signin_page_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../styles/color_palette.dart';
import '../../../styles/fonts.dart';
import 'signup_page_event.dart';
import 'signup_page_state.dart';

class SignupPageBloc extends Bloc<SignupPageEvent, SignupPageState> {
  late TextEditingController nameTextEditingController =
      TextEditingController();
  late TextEditingController emailTextEditingController =
      TextEditingController();
  late TextEditingController passwordTextEditingController =
      TextEditingController();
  SignupPageBloc(BuildContext context) : super(SignupPageState.initialState) {
    on<SubmitUserDataEvent>((event, emit) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      FirebaseAuth auth = FirebaseAuth.instance;
      try {
        emit(state.clone(
            isLoading: true)); //  when we want a new state for your bloc
        User? user = (await auth.createUserWithEmailAndPassword(
                email: event.email, password: event.password))
            .user;

        if (user != null) {
          user.updateDisplayName(event.name);
          await firestore.collection('users').doc(auth.currentUser!.uid).set({
            "name": event.name,
            "email": event.email,
            "status": "Unavalible",
            "uid": auth.currentUser!.uid
          });
          showTopSnackBar(
            context,
            const CustomSnackBar.success(
              backgroundColor: CustomColors.PRIMARY_VARIANT,
              message: "Successfully  created account, Please login",
              textStyle: CustomTextStyles.ERROR_TEXT_STYLE,
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => SignINPageProvider()),
            ),
          );
          emit(state.clone(isLoading: false));
          log('message');
        } else {
          emit(state.clone(isLoading: false));
        }
      } catch (e) {
        emit(state.clone(isLoading: false));
        return Future.error(e.toString());
      }
    });
  }
}
