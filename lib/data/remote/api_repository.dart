import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../../utils/results.dart';

class ApiRepository {
  static Future<Result<String, Exception>> getPokemonListBody() async {
    final response = await http.get(Uri.parse(url));

    switch (response.statusCode) {
      case 200:
        return Success(response.body);
      default:
        return Failure(Exception(response.reasonPhrase));
    }
  }

  static Future<Result<String, Exception>> getPokemonBody(
      String pokemonUrl) async {
    final response = await http.get(Uri.parse(pokemonUrl));

    switch (response.statusCode) {
      case 200:
        return Success(response.body);
      default:
        return Failure(Exception(response.reasonPhrase));
    }
  }
}
