import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pcheck_profile_bloc.dart';
import 'pcheck_profile.dart';

class PCheckerProfilePageProvider
    extends BlocProvider<PCheckerProfilePageBloc> {
  PCheckerProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => PCheckerProfilePageBloc(context),
          child: const PCheckerProfilePageView(),
        );
}
