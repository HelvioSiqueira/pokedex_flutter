import 'package:flutter/material.dart';
import 'package:pokedex_flutter/components/pokemon_list_widget.dart';
import 'package:pokedex_flutter/poviders/pokemon_list.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<PokemonList>(context, listen: false).getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PokeList"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: const PokemonListWidget(),
        ));
  }
}
