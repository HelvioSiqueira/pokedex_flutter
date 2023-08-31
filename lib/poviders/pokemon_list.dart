import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_item.dart';
import '../models/pokemon_list_item.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {
  var url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";

  final List<PokemonListItem> _pokelist = [];

  List<PokemonListItem> get pokelist => [..._pokelist];

  Future<void> getPokemonList() async {
    _pokelist.clear();

    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> results = data["results"];

    results.forEach((pokemon) {
      _pokelist
          .add(PokemonListItem.fromMap(pokemon));
    });

    notifyListeners();
  }

  Future<PokemonItem> getPokemon(String pokemonUrl) async {

    final response = await http.get(Uri.parse(pokemonUrl));

    Map<String, dynamic> data = jsonDecode(response.body);

    notifyListeners();

    return PokemonItem.fromMap(data);
  }

}
