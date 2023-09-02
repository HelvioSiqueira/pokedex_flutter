import 'dart:convert';

class PokemonListItem {
  PokemonListItem({required this.name, required this.url});

  String name;
  String url;
  List<String> types = [];

  String get imageUrl =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${url.split("/")[6]}.png";
  String get number => url.split("/")[6];

  factory PokemonListItem.fromMap(Map<String, dynamic> map) {
    return PokemonListItem(name: map["name"], url: map["url"]);
  }

  factory PokemonListItem.fromJson(String json) {
    return PokemonListItem.fromMap(jsonDecode(json));
  }

  @override
  String toString() {
    return "$name | $url";
  }
}
