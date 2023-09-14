import 'package:flutter/material.dart';
import 'package:pokedex_flutter/data/local/database_repository.dart';
import 'package:pokedex_flutter/models/pokemon_list_item.dart';

import '../models/pokemon_item.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final PokemonItem pokemonItem =
        ModalRoute.of(context)!.settings.arguments as PokemonItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonItem.name),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(pokemonItem.imageUrl),
              Positioned(
                right: 10,
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () {
                          pokemonItem.setIsFavorite(!pokemonItem.isFavorite);

                          setState(() {
                            DatabaseRepository.insertPokemon(pokemonItem);
                          });
                        },
                        child: Icon(
                          pokemonItem.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 40,
                        ),
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
