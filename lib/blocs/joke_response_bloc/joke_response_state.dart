part of 'joke_response_bloc.dart';

abstract class JokeResponseState extends Equatable {
  const JokeResponseState();

  @override
  List<Object> get props => [];
}

class JokeResponseInitial extends JokeResponseState {}

class JokeResponseLoading extends JokeResponseState {
  final String message;

  const JokeResponseLoading({required this.message});
  @override
  List<Object> get props => [message];
}

class JokeResponseLoaded extends JokeResponseState {
  final JokeResponse jokeResponse;

  const JokeResponseLoaded({required this.jokeResponse});
  @override
  List<Object> get props => [jokeResponse];
}

class JokeResponseError extends JokeResponseState {
  final String message;

  const JokeResponseError({required this.message});
  @override
  List<Object> get props => [message];
}
