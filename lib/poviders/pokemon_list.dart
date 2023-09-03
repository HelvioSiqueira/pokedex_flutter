import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/remote/api_repository.dart';
import 'package:pokedex_flutter/models/pokemon_item.dart';
import '../utils/results.dart';

import '../models/pokemon_list_item.dart';

class PokemonList with ChangeNotifier {
  final List<PokemonListItem> _pokelist = [];

  List<PokemonListItem> get pokelist => [..._pokelist];

  String errorPokemonList = "";

  Future<void> getPokemonList() async {
    _pokelist.clear();

    var result = await ApiRepository.getPokemonListBody();

    final value = switch (result) {
      Success(value: final data) => data.toString(),
      Failure(exception: final exception) => exception
    };

    if (value is String) {
      Map<String, dynamic> data = jsonDecode(value);

      List<dynamic> results = data["results"];

      for (var pokemon in results) {
        _pokelist.add(PokemonListItem.fromMap(pokemon));
      }
    } else if (value is Exception) {
      errorPokemonList = "Deu erro pra pegar a lista de pokemon, meu brother";
    }

    notifyListeners();
  }

  Future<PokemonItem?> getPokemon(String pokemonUrl) async {
    var result = await ApiRepository.getPokemonBody(pokemonUrl);

    final value = switch (result) {
      Success(value: final data) => data.toString(),
      Failure(exception: final exception) => exception
    };

    if (value is String) {
      Map<String, dynamic> data = jsonDecode(value);

      notifyListeners();

      return PokemonItem.fromMap(data);
    } else if (value is Exception) {
      errorPokemonList = "Deu erro pra obter o pokemon, meu brother";

      notifyListeners();
      return null;
    } else {
      return null;
    }
  }
}
