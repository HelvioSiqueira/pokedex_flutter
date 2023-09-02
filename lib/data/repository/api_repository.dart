import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

class ApiRepository {
  static Future getPokemonListBody() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return {};
    }
  }

  static Future getPokemonBody(String pokemonUrl) async {
    final response = await http.get(Uri.parse(pokemonUrl));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return {};
    }
  }
}
