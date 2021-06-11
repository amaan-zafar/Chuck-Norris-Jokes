import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:jokes/network/api_exceptions.dart';

class ApiProvider {
  static const String _baseUrl = "https://api.chucknorris.io/";
  final http.Client httpClient;

  ApiProvider({required this.httpClient});

  Future<dynamic> get(String url) async {
    var uri = Uri.parse(_baseUrl + url);
    print('Uri is $uri');
    var responseJson;
    try {
      final response = await httpClient.get(uri);
      print('fetched res is $response');
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on FormatException {
      throw FetchDataException('Format Exception');
    }
    print('res is $responseJson');
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
