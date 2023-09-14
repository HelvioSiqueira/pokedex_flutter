import 'package:pokedex_flutter/models/pokemon_item.dart';
import 'package:pokedex_flutter/models/stats_pokemon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../../models/type_pokemon.dart';

class DatabaseRepository {
  static Future<Database> dataBasePokemon() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(path.join(dbPath, "pokemon.db"), version: 1,
        onCreate: (db, version) async {
      await db
          .execute("CREATE TABLE IF NOT EXISTS pokemon (id INTEGER PRIMARY KEY,"
              " name TEXT,"
              " height INTEGER,"
              " weight INTEGER,"
              " types INTEGER,"
              " stats INTEGER,"
              " isFavorite TEXT,"
              " imageUrl TEXT)");

      await db.execute(
          "CREATE TABLE IF NOT EXISTS stats (id INTEGER PRIMARY KEY AUTOINCREMENT,"
          " hp INTEGER,"
          " attack INTEGER,"
          " defense INTEGER,"
          " specialattack INTEGER,"
          " specialdefense INTEGER,"
          " speed INTEGER)");

      await db.execute(
          "CREATE TABLE IF NOT EXISTS types (id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "firstType TEXT,"
          "secondType TEXT)");
    });
  }

  static Future<int> insertTypes(Types types) async {
    final dbTypes = await DatabaseRepository.dataBasePokemon();

    var values = {
      "firstType": types.typeList.elementAtOrNull(0),
      "secondType": types.typeList.elementAtOrNull(1) ?? ""
    };

    return await dbTypes.insert("types", values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<String>> getTypes(int id) async {
    final dbTypes = await DatabaseRepository.dataBasePokemon();

    var mapTypes =
        await dbTypes.query("types", where: "id = ?", whereArgs: [id]);

    List<String> types = [];

    String firstType = mapTypes.first["firstType"] as String;
    String secondType = mapTypes.first["secondType"] as String;

    types.add(firstType);

    if (secondType != "") types.add(secondType);

    return types;
  }

  static Future<int> insertStats(Stats stats) async {
    final dbStats = await DatabaseRepository.dataBasePokemon();

    Map<String, dynamic> values = {};

    for (var stat in stats.listStats) {
      if (stat.nameStat == "special-attack" ||
          stat.nameStat == "special-defense") {
        values.addAll({stat.nameStat.replaceFirst("-", ""): stat.baseStat});
      } else {
        values.addAll({stat.nameStat: stat.baseStat});
      }
    }

    return await dbStats.insert("stats", values);
  }

  static Future<Stats> getStats(int id) async {
    final dbStats = await DatabaseRepository.dataBasePokemon();

    var mapStats =
        await dbStats.query("stats", where: "id = ?", whereArgs: [id]);

    List<StatsItem> stats = [];

    stats.add(StatsItem(baseStat: mapStats.first["hp"] as int, nameStat: "hp"));
    stats.add(StatsItem(
        baseStat: mapStats.first["attack"] as int, nameStat: "attack"));
    stats.add(StatsItem(
        baseStat: mapStats.first["defense"] as int, nameStat: "defense"));
    stats.add(StatsItem(
        baseStat: mapStats.first["specialattack"] as int,
        nameStat: "specialattack"));
    stats.add(StatsItem(
        baseStat: mapStats.first["specialdefense"] as int,
        nameStat: "specialdefense"));
    stats.add(
        StatsItem(baseStat: mapStats.first["speed"] as int, nameStat: "speed"));

    return Stats(listStats: stats);
  }

  static Future<void> insertPokemon(PokemonItem pokemonItem) async {
    final dbPokemon = await DatabaseRepository.dataBasePokemon();

    Map<String, dynamic> values = {
      "id": pokemonItem.id,
      "name": pokemonItem.name,
      "weight": pokemonItem.weight,
      "height": pokemonItem.height,
      "types": await insertTypes(pokemonItem.types),
      "stats": await insertStats(pokemonItem.pokemonStats),
      "isFavorite": pokemonItem.isFavorite.toString(),
      "imageUrl": pokemonItem.imageUrl
    };

    dbPokemon.insert("pokemon", values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<PokemonItem>> getAllPokemon() async {
    final dbPokemon = await DatabaseRepository.dataBasePokemon();

    var recs = await dbPokemon.query("pokemon");

    return recs.map((pokemon) => PokemonItem.fromMap(pokemon)).toList();
  }

  static Future<PokemonItem> getPokemonById(String pokemonId) async {
    final dbPokemon = await DatabaseRepository.dataBasePokemon();

    var recs = await dbPokemon
        .rawQuery("SELECT * FROM pokemon WHERE id = ?", [pokemonId]);

    return PokemonItem.fromMap(recs.first);
  }
}
