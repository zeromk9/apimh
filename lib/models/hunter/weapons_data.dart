import 'dart:convert';

class Weapons {
  String name;
  Assets assets;

  Weapons({
    required this.name,
    required this.assets,
  });

  factory Weapons.fromRawJson(String str) => Weapons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weapons.fromJson(Map<String, dynamic> json) => Weapons(
        name: json["name"],
        assets: Assets.fromJson(json["assets"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "assets": assets.toJson(),
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
