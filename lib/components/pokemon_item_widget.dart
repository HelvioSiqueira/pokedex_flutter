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
      title: Text(pokeListItem.name.capitalize()),
      subtitle: Row(
        children: pokeListItem.types.map((type) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.amber),
              child: Text(type.capitalize()),
            ),
          );
        }).toList(),
      ),
    ));
  }
}

extension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1, length)}";
  }
}
