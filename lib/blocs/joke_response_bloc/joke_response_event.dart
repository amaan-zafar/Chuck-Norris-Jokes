part of 'joke_response_bloc.dart';

abstract class JokeResponseEvent extends Equatable {
  const JokeResponseEvent();

  @override
  List<Object> get props => [];
}

class GetJokeResponse extends JokeResponseEvent {
  final String category;

  GetJokeResponse({required this.category});
  @override
  List<Object> get props => [category];
}
