import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'own_profile_bloc.dart';
import 'own_profile.dart';

class AdminProfilePageProvider extends BlocProvider<AdminProfilePageBloc> {
  AdminProfilePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AdminProfilePageBloc(context),
          child: const AdminProfilePageView(),
        );
}
