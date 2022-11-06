import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'pcheck_home_event.dart';
import 'pcheck_home_state.dart';

class CustomerHomePageBloc
    extends Bloc<PCheckerHomePageEvent, PCheckerHomePageState> {
  CustomerHomePageBloc(BuildContext context)
      : super(PCheckerHomePageState.initialState);
}
