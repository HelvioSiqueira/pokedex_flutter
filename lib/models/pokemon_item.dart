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
      required this.pokemonStats,
      required this.isFavorite});

  int id;
  String name;
  int height;
  int weight;
  Types types;
  Stats pokemonStats;
  bool isFavorite;
  String imageUrl = "";

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

    print(stats);

    return PokemonItem(
        id: map["id"],
        name: map["name"],
        height: map["height"],
        weight: map["weight"],
        types: types,
        pokemonStats: stats,
        isFavorite: map["isFavorite"] == "true" ? true : false);
  }

  factory PokemonItem.fromJson(String json) {
    return PokemonItem.fromMap(jsonDecode(json));
  }

  setIsFavorite(bool value) {
    isFavorite = value;
  }

  @override
  String toString() {
    return "id: $id, name: $name, height: $height, weight: $weight, types: $types, pokemonStats: $pokemonStats";
  }
}
