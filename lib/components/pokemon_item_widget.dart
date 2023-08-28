import 'package:flutter/material.dart';

class PokemonItemWidget extends StatelessWidget {
  PokemonItemWidget({Key? key, required this.namePokemon}) : super(key: key);

  String namePokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(padding: EdgeInsets.all(8), child: Text(namePokemon)),
    );
  }
}
