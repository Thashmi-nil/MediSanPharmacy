part of 'get_category_bloc.dart';

abstract class GetCategoryEvent {}

class GetMyCategoryEvent extends GetCategoryEvent {
  String category;
  GetMyCategoryEvent(this.category);
}
