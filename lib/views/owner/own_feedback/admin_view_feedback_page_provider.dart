import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'admin_view_feedback_page_bloc.dart';
import 'admin_view_feedback_page_view.dart';

class AdminViewFeedBackPageProvider
    extends BlocProvider<AdminViewFeedBackPageBloc> {
  AdminViewFeedBackPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AdminViewFeedBackPageBloc(context),
          child: const AdminViewFeedBackPageView(),
        );
}
