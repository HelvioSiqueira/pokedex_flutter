import 'package:flutter/material.dart';
import 'pokemon_list_item.dart';
import 'package:http/http.dart' as http;

class PokemonList with ChangeNotifier {
  var url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0";


  List<PokemonListItem> _items = [];
  List<PokemonListItem> get items => [..._items];

  Future<void> getPokemonList() async {
    _items.clear();

    final response = await http.get(Uri.parse(url));

    if(response.body == null) return;


  }
}
