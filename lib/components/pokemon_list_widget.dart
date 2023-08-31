import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/pokemon_item_widget.dart';
import 'package:provider/provider.dart';

import '../poviders/pokemon_list.dart';
import '../models/pokemon_list_item.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PokemonList>(context);
    List<PokemonListItem> pokelist = provider.pokelist;

    return ListView.builder(
        itemCount: pokelist.length,
        itemBuilder: (context, index) {
          var pokeitem = pokelist[index];

          if (pokeitem.types.isEmpty) {
            provider.getPokemon(pokeitem.url).then((value) {
              pokeitem.types = value.types
                  .expand((element) => element.types.map((e) => e.name))
                  .toList();
            });
          }

          return PokemonItemWidget(pokeListItem: pokeitem);
        });
  }
}
