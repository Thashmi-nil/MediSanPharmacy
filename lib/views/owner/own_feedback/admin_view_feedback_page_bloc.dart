import 'dart:developer';
import 'package:medisan/models/feedback_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'admin_view_feedback_page_event.dart';
import 'admin_view_feedback_page_state.dart';

class AdminViewFeedBackPageBloc
    extends Bloc<AdminViewFeedBackPageEvent, AdminViewFeedBackPageState> {
  AdminViewFeedBackPageBloc(BuildContext context)
      : super(AdminViewFeedBackPageState.initialState) {
    on<InitEvent>((event, emit) async {
      List<FeedbackModel> feedbacks = [];
      try {
        emit(state.clone(isLoading: true));
        var data =
            await FirebaseFirestore.instance.collection("feedbacks").get();
        for (int i = 0; i < data.docs.length; i++) {
          FeedbackModel model = FeedbackModel(
              id: data.docs[i].data()['feedbackID'],
              msg: data.docs[i].data()['feedback']);
          feedbacks.add(model);
        }
        emit(state.clone(isLoading: false, feedbacks: feedbacks));

        log(feedbacks.toString());
      } catch (e) {
        return Future.error(e.toString());
      }
    });
    add(InitEvent());
  }
}
