import 'dart:convert';

class Armors {
  int id;
  String name;
  List<Piece> pieces;
  Bonus bonus;

  Armors({
    required this.id,
    required this.name,
    required this.pieces,
    required this.bonus,
  });

  factory Armors.fromRawJson(String str) => Armors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Armors.fromJson(Map<String, dynamic> json) => Armors(
        id: json["id"],
        name: json["name"],
        pieces: List<Piece>.from(json["pieces"].map((x) => Piece.fromJson(x))),
        bonus: Bonus.fromJson(json["bonus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pieces": List<dynamic>.from(pieces.map((x) => x.toJson())),
        "bonus": bonus.toJson(),
      };
}

class Bonus {
  int id;
  String name;
  List<RankElement> ranks;

  Bonus({
    required this.id,
    required this.name,
    required this.ranks,
  });

  factory Bonus.fromRawJson(String str) => Bonus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
        id: json["id"],
        name: json["name"],
        ranks: List<RankElement>.from(
            json["ranks"].map((x) => RankElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
      };
}

class RankElement {
  int pieces;
  String description;

  RankElement({
    required this.pieces,
    required this.description,
  });

  factory RankElement.fromRawJson(String str) =>
      RankElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RankElement.fromJson(Map<String, dynamic> json) => RankElement(
        pieces: json["pieces"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "pieces": pieces,
        "description": description,
      };
}

class Piece {
  int id;
  int rarity;
  Defense defense;
  Resistances resistances;
  String name;

  Piece({
    required this.id,
    required this.rarity,
    required this.defense,
    required this.resistances,
    required this.name,
  });

  factory Piece.fromRawJson(String str) => Piece.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Piece.fromJson(Map<String, dynamic> json) => Piece(
        id: json["id"],
        rarity: json["rarity"],
        defense: Defense.fromJson(json["defense"]),
        resistances: Resistances.fromJson(json["resistances"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "defense": defense.toJson(),
        "resistances": resistances.toJson(),
        "name": name,
      };
}

class ArmorsAssets {
  //Puede dar error el provider y la api externa****************************************************************
  String imageMale;
  String imageFemale;

  ArmorsAssets({
    required this.imageMale,
    required this.imageFemale,
  });

  factory ArmorsAssets.fromRawJson(String str) =>
      ArmorsAssets.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArmorsAssets.fromJson(Map<String, dynamic> json) => ArmorsAssets(
        imageMale: json["imageMale"],
        imageFemale: json["imageFemale"],
      );

  Map<String, dynamic> toJson() => {
        "imageMale": imageMale,
        "imageFemale": imageFemale,
      };
}

class Defense {
  int base;
  int max;
  int augmented;

  Defense({
    required this.base,
    required this.max,
    required this.augmented,
  });

  factory Defense.fromRawJson(String str) => Defense.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Defense.fromJson(Map<String, dynamic> json) => Defense(
        base: json["base"],
        max: json["max"],
        augmented: json["augmented"],
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "max": max,
        "augmented": augmented,
      };
}

class Resistances {
  int fire;
  int water;
  int ice;
  int thunder;
  int dragon;

  Resistances({
    required this.fire,
    required this.water,
    required this.ice,
    required this.thunder,
    required this.dragon,
  });

  factory Resistances.fromRawJson(String str) =>
      Resistances.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Resistances.fromJson(Map<String, dynamic> json) => Resistances(
        fire: json["fire"],
        water: json["water"],
        ice: json["ice"],
        thunder: json["thunder"],
        dragon: json["dragon"],
      );

  Map<String, dynamic> toJson() => {
        "fire": fire,
        "water": water,
        "ice": ice,
        "thunder": thunder,
        "dragon": dragon,
      };
}
