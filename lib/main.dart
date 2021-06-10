import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/repositories/jokes_repo.dart';
import 'package:jokes/ui/jokes_categories_page.dart';

void main() {
  final ChuckJokesRepository _jokesRepository = ChuckJokesRepository();
  runApp(MyApp(
    jokesRepository: _jokesRepository,
  ));
}

class MyApp extends StatelessWidget {
  final ChuckJokesRepository jokesRepository;

  const MyApp({Key? key, required this.jokesRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Jokes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoriesPage(),
    );
  }
}
