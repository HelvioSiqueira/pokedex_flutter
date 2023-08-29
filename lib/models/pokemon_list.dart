import 'dart:convert';

import 'package:flutter/material.dart';
import 'pokemon_list_item.dart';
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
          .add(PokemonListItem(name: pokemon["name"], url: pokemon["url"]));
    });

    notifyListeners();
  }

  Future<List<String>> getPokemon(String pokemonUrl) async {
    List<String> types = [];

    final response = await http.get(Uri.parse(pokemonUrl));

    Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> typeList = data["types"];

    typeList.forEach((element) {
      var type = element["type"];
      types.add(type["name"]);
    });

    print(types);

    notifyListeners();

    return types;
  }
}
