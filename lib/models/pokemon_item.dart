import 'dart:convert';

class PokemonItem {
  PokemonItem(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.types});

  int id;
  String name;
  int height;
  int weight;
  List<Types> types;

  factory PokemonItem.fromMap(Map<String, dynamic> map) {
    return PokemonItem(
        id: map["id"],
        name: map["name"],
        height: map["height"],
        weight: map["weight"],
        types: [Types.fromMap(map["types"])]);
  }

  factory PokemonItem.fromJson(String json) {
    return PokemonItem.fromMap(jsonDecode(json));
  }
}

class Types {
  Types({required this.types});

  List<Type> types;

  factory Types.fromMap(List<dynamic> list) {
    List<Type> typesToReturn = [];

    for (var element in list) {
      typesToReturn.add(Type.fromMap(element));
    }

    return Types(types: typesToReturn);
  }

  factory Types.fromJson(String json) => Types.fromMap(jsonDecode(json));
}

class Type {
  Type({required this.name});

  String name;

  factory Type.fromMap(Map<String, dynamic> map) {
    var type = map["type"];

    return Type(name: type["name"]);
  }

  factory Type.fromJson(String json) => Type.fromJson(jsonDecode(json));
}
