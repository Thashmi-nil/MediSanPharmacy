import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'own_products_bloc.dart';
import 'own_products_view.dart';

class AdminProductDetailsPageProvider
    extends BlocProvider<AdminProductDetailsPageBloc> {
  AdminProductDetailsPageProvider({Key? key})
      : super(
          key: key,
          create: (context) => AdminProductDetailsPageBloc(context),
          // child: const AdminProductDetailsPageView(),
        );
}
