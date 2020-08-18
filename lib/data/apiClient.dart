import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:undercover/models/gameModel.dart';
import 'package:undercover/utils/constants.dart';

class ApiClient {
  final http.Client httpClient;

  ApiClient(this.httpClient) : assert(httpClient != null);

  Future<Game> getGame() async {
    var gameResponse = await this.httpClient.get(Constants.url);
    if (gameResponse.statusCode != 200) {
      throw Exception('error');
    }

    var gameJson = jsonDecode(gameResponse.body);
    return Game.fromJson(gameJson);
  }
}
