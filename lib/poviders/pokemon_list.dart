import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/repository/api_repository.dart';
import 'package:pokedex_flutter/models/pokemon_item.dart';

import '../models/pokemon_list_item.dart';

class PokemonList with ChangeNotifier {
  final List<PokemonListItem> _pokelist = [];

  List<PokemonListItem> get pokelist => [..._pokelist];

  Future<void> getPokemonList() async {
    _pokelist.clear();

    var body = await ApiRepository.getPokemonListBody();

    Map<String, dynamic> data = jsonDecode(body);

    List<dynamic> results = data["results"];

    for (var pokemon in results) {
      _pokelist.add(PokemonListItem.fromMap(pokemon));
    }

    notifyListeners();
  }

  Future<PokemonItem> getPokemon(String pokemonUrl) async {
    var body = await ApiRepository.getPokemonBody(pokemonUrl);

    Map<String, dynamic> data = jsonDecode(body);

    notifyListeners();

    return PokemonItem.fromMap(data);
  }
}
