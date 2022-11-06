import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pcheck_home_bloc.dart';
import 'pcheck_home.dart';

class PCheckerHomePageProvider extends BlocProvider<CustomerHomePageBloc> {
  PCheckerHomePageProvider({Key? key})
      : super(
          key: key,
          create: (context) => CustomerHomePageBloc(context),
          child: const PCheckerHomePageView(),
        );
}
