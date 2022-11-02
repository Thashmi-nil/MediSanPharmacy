import 'package:medisan/models/feedback_model.dart';
import 'package:flutter/foundation.dart';

@immutable
class AdminViewFeedBackPageState {
  final String error;
  final List<FeedbackModel> feedbacks;
  final bool isLoading;

  const AdminViewFeedBackPageState({
    required this.error,
    required this.feedbacks,
    required this.isLoading,
  });

  static AdminViewFeedBackPageState get initialState {
    return const AdminViewFeedBackPageState(
        error: '', feedbacks: [], isLoading: false);
  }

  AdminViewFeedBackPageState clone({
    String? error,
    List<FeedbackModel>? feedbacks,
    bool? isLoading,
  }) {
    return AdminViewFeedBackPageState(
      error: error ?? this.error,
      feedbacks: feedbacks ?? this.feedbacks,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
