import 'dart:convert';

import 'package:pokedex_flutter/data/local/database_repository.dart';
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
  Types types;
  Stats pokemonStats;

  factory PokemonItem.fromMap(Map<String, dynamic> map) {
    Types types = Types(typeList: []);
    Stats stats = Stats(listStats: []);

    try {
      types.typeList = Types.fromMap(map["types"]).typeList;
    } catch (error) {
      DatabaseRepository.getTypes(map["types"] as int).then((value) {
        types.typeList = value;
      });
    }

    try {
      stats = Stats.fromMap(map["stats"]);
    } catch (error) {
      DatabaseRepository.getStats(map["stats"] as int).then((value) {
        stats = value;
      });
    }

    return PokemonItem(
        id: map["id"],
        name: map["name"],
        height: map["height"],
        weight: map["weight"],
        types: types,
        pokemonStats: stats);
  }

  factory PokemonItem.fromJson(String json) {
    return PokemonItem.fromMap(jsonDecode(json));
  }

  @override
  String toString() {
    return "id: $id, name: $name, height: $height, weight: $weight, types: $types, pokemonStats: $pokemonStats";
  }
}
