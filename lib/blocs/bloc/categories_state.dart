part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {
  final String message;

  const CategoriesLoading({required this.message});
  @override
  List<Object> get props => [message];
}

class CategoriesLoaded extends CategoriesState {
  final JokesCategories categoriesList;

  const CategoriesLoaded({required this.categoriesList});
  @override
  List<Object> get props => [categoriesList];
}

class CategoriesError extends CategoriesState {
  final String message;

  const CategoriesError({required this.message});
  @override
  List<Object> get props => [message];
}
