part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CategoriesEvent {
  @override
  List<Object> get props => [];
}

class CategoriesRefreshRequested extends CategoriesEvent {
  @override
  List<Object> get props => [];
}
