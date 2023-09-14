import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/type_widget.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';
import 'package:pokedex_flutter/utils/app_routes.dart';
import 'package:pokedex_flutter/utils/capitilize.dart';

import '../data/local/database_repository.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({Key? key, required this.pokeListItem})
      : super(key: key);

  final PokemonListItem pokeListItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {
        DatabaseRepository.getPokemonById(pokeListItem.number).then((pokemon) {
          var findedPokemon = pokemon;
          findedPokemon.imageUrl = pokeListItem.imageUrl;

          Navigator.of(context)
              .pushNamed(AppRoutes.DETAILS, arguments: findedPokemon);
        });
      },
      child: ListTile(
        leading: Image.network(pokeListItem.imageUrl),
        title:
            Text("#${pokeListItem.number} ${pokeListItem.name.capitalize()}"),
        subtitle: Row(
          children: pokeListItem.types.map((type) {
            return TypeWidget(type: type);
          }).toList(),
        ),
      ),
    ));
  }
}
