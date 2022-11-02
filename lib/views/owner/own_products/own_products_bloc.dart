import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'own_products_event.dart';
import 'own_producs_state.dart';

class AdminProductDetailsPageBloc
    extends Bloc<AdminProductDetailsPageEvent, AdminProductDetailsPageState> {
  AdminProductDetailsPageBloc(BuildContext context)
      : super(AdminProductDetailsPageState.initialState);
}
