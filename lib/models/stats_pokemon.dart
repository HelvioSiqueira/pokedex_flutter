import 'dart:convert';

class Stats {
  Stats({required this.listStats});

  List<StatsItem> listStats;

  factory Stats.fromMap(List<dynamic> map) =>
      Stats(listStats: map.map((e) => StatsItem.fromMap(e)).toList());

  factory Stats.fromJson(String json) => Stats.fromJson(jsonDecode(json));

  @override
  String toString() {
    return listStats.map((e) => e.toString()).toString();
  }
}

class StatsItem {
  StatsItem({required this.baseStat, required this.nameStat});

  int baseStat;
  String nameStat;

  factory StatsItem.fromMap(Map<String, dynamic> map) =>
      StatsItem(baseStat: map["base_stat"], nameStat: map["stat"]["name"]);

  factory StatsItem.fromJson(String json) =>
      StatsItem.fromMap(jsonDecode(json));

  @override
  String toString() {
    return "$nameStat: $baseStat";
  }
}
