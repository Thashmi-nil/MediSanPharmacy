import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'own_home_bloc.dart';
import 'own_home.dart';

class AdminHomePageProvider extends BlocProvider<AdminHomePageBloc> {
  AdminHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AdminHomePageBloc(context),
          child: const AdminHomePageView(),
        );
}
