import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'customer_profile_page_event.dart';
import 'customer_profile_page_state.dart';

class CustomerProfilePageBloc
    extends Bloc<CustomerProfilePageEvent, CustomerProfilePageState> {
  late TextEditingController textEditingController = TextEditingController();
  CustomerProfilePageBloc(BuildContext context)
      : super(CustomerProfilePageState.initialState) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    var uuid = const Uuid();
    on<AddFeedBackEvent>((event, emit) async {
      try {
        emit(state.clone(isLoading: true));
        await firestore.collection('feedbacks').doc(uuid.v4()).set({
          "userID": auth.currentUser!.uid,
          "feedbackID": uuid.v4(),
          "feedback": event.feedback
        });
        emit(state.clone(isLoading: false));
      } catch (e) {
        emit(state.clone(isLoading: false));
        return Future.error(e.toString());
      }
    });
    on<InitEvent>((event, emit) {
      emit(state.clone(isLoading: true));
      emit(state.clone(isLoading: false, email: auth.currentUser!.email));
    });
    add(InitEvent());
  }
}
