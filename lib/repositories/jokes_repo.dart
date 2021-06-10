import 'package:jokes/models/joke_response.dart';
import 'package:jokes/models/jokes_categories.dart';
import 'package:jokes/network/api_base_helper.dart';

abstract class JokesRepository {
  Future<JokesCategories> fetchCategories();
  Future<JokeResponse> fetchJokeResponseData(String category);
}

class ChuckJokesRepository implements JokesRepository {
  ApiProvider _apiProvider = ApiProvider();

  @override
  Future<JokesCategories> fetchCategories() async {
    final response = await _apiProvider.get('jokes/categories');
    return JokesCategories.fromJson(response);
  }

  @override
  Future<JokeResponse> fetchJokeResponseData(String category) async {
    final response =
        await _apiProvider.get('jokes/random?category=' + category);
    return JokeResponse.fromJson(response);
  }
}
