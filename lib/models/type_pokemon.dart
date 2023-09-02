import 'dart:convert';

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
