import 'dart:convert';

class Weapons {
  int id;
  int rarity;
  Attack attack;
  Attributes attributes;
  String name;
  Crafting crafting;
  Assets assets;

  Weapons({
    required this.id,
    required this.rarity,
    required this.attack,
    required this.attributes,
    required this.name,
    required this.crafting,
    required this.assets,
  });

  factory Weapons.fromRawJson(String str) => Weapons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weapons.fromJson(Map<String, dynamic> json) => Weapons(
        id: json["id"],
        rarity: json["rarity"],
        attack: Attack.fromJson(json["attack"]),
        attributes: Attributes.fromJson(json["attributes"]),
        name: json["name"],
        crafting: Crafting.fromJson(json["crafting"]),
        assets: Assets.fromJson(json["assets"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rarity": rarity,
        "attack": attack.toJson(),
        "attributes": attributes.toJson(),
        "name": name,
        "crafting": crafting.toJson(),
        "assets": assets.toJson(),
      };
}

class Attack {
  int display;
  int raw;

  Attack({
    required this.display,
    required this.raw,
  });

  factory Attack.fromRawJson(String str) => Attack.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
        display: json["display"],
        raw: json["raw"],
      );

  Map<String, dynamic> toJson() => {
        "display": display,
        "raw": raw,
      };
}

class Attributes {
  dynamic affinity;
  int defense;

  Attributes({
    required this.affinity,
    required this.defense,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        affinity: json["affinity"],
        defense: json["defense"],
      );

  Map<String, dynamic> toJson() => {
        "affinity": affinity,
        "defense": defense,
      };
}

class Crafting {
  bool craftable;
  int previous;

  Crafting({
    required this.craftable,
    required this.previous,
  });

  factory Crafting.fromRawJson(String str) =>
      Crafting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Crafting.fromJson(Map<String, dynamic> json) => Crafting(
        craftable: json["craftable"],
        previous: json["previous"],
      );

  Map<String, dynamic> toJson() => {
        "craftable": craftable,
        "previous": previous,
      };
}

class Assets {
  String icon;
  String image;

  Assets({
    required this.icon,
    required this.image,
  });

  factory Assets.fromRawJson(String str) => Assets.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assets.fromJson(Map<String, dynamic> json) => Assets(
        icon: json["icon"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "image": image,
      };
}
