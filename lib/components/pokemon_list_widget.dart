import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pokemon_list.dart';
import '../models/pokemon_list_item.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PokemonListItem> pokelist =
        Provider.of<PokemonList>(context).pokelist;

    return Container(
      child: ListView.builder(
          itemCount: pokelist.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.network(pokelist[index].imageUrl),
                title: Text(
                    "${pokelist[index].name[0].toUpperCase()}${pokelist[index].name.substring(1, pokelist[index].name.length)}"),
              ),
            );
          }),
    );
  }
}
