import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'own_profile_event.dart';
import 'own_profile_state.dart';

class AdminProfilePageBloc
    extends Bloc<AdminProfilePageEvent, AdminProfilePageState> {
  AdminProfilePageBloc(BuildContext context)
      : super(AdminProfilePageState.initialState);
}
