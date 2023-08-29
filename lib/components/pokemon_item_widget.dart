import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';

class PokemonItemWidget extends StatelessWidget {
  PokemonItemWidget({Key? key, required this.pokeListItem}) : super(key: key);

  PokemonListItem pokeListItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(pokeListItem.imageUrl),
      title: Text(
          "${pokeListItem.name[0].toUpperCase()}${pokeListItem.name.substring(1, pokeListItem.name.length)}"),
      subtitle: Row(
        children: pokeListItem.types.map((type) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(type),
          );
        }).toList(),
      ),
    ));
  }
}
