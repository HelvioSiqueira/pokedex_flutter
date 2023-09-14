import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/pokemon_item_widget.dart';
import 'package:pokedex_flutter/data/local/database_repository.dart';
import 'package:provider/provider.dart';

import '../poviders/pokemon_list.dart';
import '../models/pokemon_list_item.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PokemonList>(context);
    List<PokemonListItem> pokelist = provider.pokelist;
    String error = provider.errorPokemonList;

    return error == ""
        ? ListView.builder(
            itemCount: pokelist.length,
            itemBuilder: (context, index) {
              var pokeitem = pokelist[index];

              if (pokeitem.types.isEmpty) {
                provider.getPokemon(pokeitem.url).then((value) {
                  if (value != null) {

                    var receivedPokemon = value;
                    receivedPokemon.imageUrl = pokeitem.imageUrl;

                    DatabaseRepository.insertPokemon(receivedPokemon);

                    pokeitem.types = value.types.typeList;
                  }
                });
              }
              return PokemonItemWidget(pokeListItem: pokeitem);
            })
        : AlertDialog(
            title: const Text("Algo aconteceu"),
            content: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text("Sair")),
              TextButton(
                  onPressed: () {
                    Provider.of<PokemonList>(context, listen: false)
                        .getPokemonList();
                  },
                  child: const Text("Tentar novamente"))
            ],
          );
  }
}
