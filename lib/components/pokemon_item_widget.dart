import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/type_widget.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';
import 'package:pokedex_flutter/utils/capitilize.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({Key? key, required this.pokeListItem})
      : super(key: key);

  final PokemonListItem pokeListItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(pokeListItem.imageUrl),
      title: Text(pokeListItem.name.capitalize()),
      subtitle: Row(
        children: pokeListItem.types.map((type) {
          return TypeWidget(type: type);
        }).toList(),
      ),
    ));
  }
}
