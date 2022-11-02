import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc(BuildContext context) : super(GetCategoryState.initialState) {
    on<GetMyCategoryEvent>((event, emit) {
      log(event.category);
      emit(state.clone(category: event.category));
    });
  }
}
