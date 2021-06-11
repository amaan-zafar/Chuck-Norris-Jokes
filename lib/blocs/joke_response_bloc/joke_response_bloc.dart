import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/models/joke_response.dart';
import 'package:jokes/repositories/jokes_repo.dart';

part 'joke_response_event.dart';
part 'joke_response_state.dart';

class JokeResponseBloc extends Bloc<JokeResponseEvent, JokeResponseState> {
  final ChuckJokesRepository jokesRepository;

  JokeResponseBloc({required this.jokesRepository})
      : super(JokeResponseInitial());

  @override
  Stream<JokeResponseState> mapEventToState(
    JokeResponseEvent event,
  ) async* {
    if (event is GetJokeResponse) {
      yield JokeResponseLoading(message: 'Loading joke...');
      try {
        final JokeResponse response =
            await jokesRepository.fetchJokeResponseData(event.category);
        yield JokeResponseLoaded(jokeResponse: response);
      } catch (e) {
        yield JokeResponseError(
            message: 'Error caught in JokeResponseBloc is ${e.toString()}');
      }
    } else if (event is JokeRefreshRequested) {
      try {
        final JokeResponse response =
            await jokesRepository.fetchJokeResponseData(event.category);
        yield JokeResponseLoaded(jokeResponse: response);
      } catch (_) {}
    }
  }
}
