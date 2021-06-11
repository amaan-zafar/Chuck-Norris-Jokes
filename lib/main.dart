import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokes/network/api_base_helper.dart';
import 'package:jokes/repositories/jokes_repo.dart';
import 'package:jokes/ui/jokes_categories_page.dart';
import 'package:http/http.dart' as http;

import 'blocs/bloc/categories_bloc.dart';
import 'blocs/blocs_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final http.Client _client = http.Client();
  final ChuckJokesRepository _jokesRepository =
      ChuckJokesRepository(apiProvider: ApiProvider(httpClient: _client));
  runApp(MyApp(
    jokesRepository: _jokesRepository,
  ));
}

class MyApp extends StatelessWidget {
  final ChuckJokesRepository jokesRepository;

  const MyApp({Key? key, required this.jokesRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoriesBloc(jokesRepository: jokesRepository),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: MaterialApp(
        title: 'Chuck Jokes',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CategoriesPage(),
      ),
    );
  }
}
