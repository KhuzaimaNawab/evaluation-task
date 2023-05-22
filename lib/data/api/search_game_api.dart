import 'dart:convert';

import '../model/game_card_model.dart';
import 'package:http/http.dart' as http;

class SearchGamesAPI {
  Future<List<GameCardModel>> gameAPI() async {
    const GAME_API =
        "https://api.gamestack.com.pk/products/subscribed-products";
    try {
      final response = await http.get(Uri.parse(GAME_API));
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final dataList = responseBody['result']['data'] as List<dynamic>;
        final data = dataList
            .map((gameJson) => GameCardModel.fromJson(gameJson))
            .toList();
        return data;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
    return [];
  }
}
