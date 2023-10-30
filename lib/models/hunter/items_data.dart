import 'dart:convert';

class Items {
  int id;
  int rarity;
  int carryLimit;
  int value;
  String name;
  String description;

  Items({
    required this.id,
    required this.rarity,
    required this.carryLimit,
    required this.value,
    required this.name,
    required this.description,
  });

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        rarity: json["rarity"],
        carryLimit: json["carryLimit"],
        value: json["value"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "carryLimit": carryLimit,
        "value": value,
        "name": name,
        "description": description,
      };
}
