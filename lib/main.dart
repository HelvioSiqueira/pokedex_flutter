import 'package:flutter/material.dart';
import 'package:pokedex_flutter/poviders/pokemon_list.dart';
import 'package:pokedex_flutter/pages/pokemon_list_page.dart';
import 'package:pokedex_flutter/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PokemonList())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {AppRoutes.HOME: (context) => const PokemonListPage()},
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.orangeAccent,
                primary: Colors.orangeAccent,
                secondary: Colors.redAccent),
            appBarTheme: const AppBarTheme(color: Colors.orangeAccent)),
      ),
    );
  }
}
