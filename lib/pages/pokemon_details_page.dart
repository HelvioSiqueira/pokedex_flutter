import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonListItem pokemonItem =
        ModalRoute.of(context)!.settings.arguments as PokemonListItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonItem.name),
      ),
      body: const Column(),
    );
  }
}
