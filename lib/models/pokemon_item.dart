import 'dart:convert';

import 'package:pokedex_flutter/models/type_pokemon.dart';
import 'package:pokedex_flutter/models/stats_pokemon.dart';

class PokemonItem {
  PokemonItem(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.types,
      required this.pokemonStats});

  int id;
  String name;
  int height;
  int weight;
  List<Types> types;
  Stats pokemonStats;

  factory PokemonItem.fromMap(Map<String, dynamic> map) {
    return PokemonItem(
        id: map["id"],
        name: map["name"],
        height: map["height"],
        weight: map["weight"],
        types: [Types.fromMap(map["types"])],
        pokemonStats: Stats.fromMap(map["stats"]));
  }

  factory PokemonItem.fromJson(String json) {
    return PokemonItem.fromMap(jsonDecode(json));
  }
}
