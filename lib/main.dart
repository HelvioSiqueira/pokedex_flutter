import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pages/pokemon_details_page.dart';
import 'package:pokedex_flutter/poviders/pokemon_list.dart';
import 'package:pokedex_flutter/pages/pokemon_list_page.dart';
import 'package:pokedex_flutter/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PokemonList())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (context) => const PokemonListPage(),
          AppRoutes.DETAILS: (context) => const PokemonDetailsPage()
        },
        theme: ThemeData(
            useMaterial3: true,
            textTheme: const TextTheme(
                bodyMedium: TextStyle(fontFamily: "Flexo"),
                bodySmall: TextStyle(fontFamily: "Flexo"),
                bodyLarge: TextStyle(fontFamily: "Flexo")),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.orangeAccent,
                primary: Colors.orangeAccent,
                secondary: Colors.redAccent),
            iconTheme: const IconThemeData(color: Colors.orangeAccent),
            appBarTheme: const AppBarTheme(
                color: Colors.orangeAccent,
                titleTextStyle: TextStyle(
                    fontFamily: "Flexo", color: Colors.black, fontSize: 26))),
      ),
    );
  }
}
