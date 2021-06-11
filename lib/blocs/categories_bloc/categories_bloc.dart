import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/models/jokes_categories.dart';
import 'package:jokes/repositories/jokes_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final ChuckJokesRepository jokesRepository;
  CategoriesBloc({required this.jokesRepository}) : super(CategoriesInitial());

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    if (event is GetCategories) {
      yield CategoriesLoading(message: 'Fetching data');
      try {
        final JokesCategories categoriesList =
            await jokesRepository.fetchCategories();
        yield CategoriesLoaded(categoriesList: categoriesList);
      } catch (e) {
        yield CategoriesError(message: 'Error: ${e.toString()}');
      }
    }
  }
}
