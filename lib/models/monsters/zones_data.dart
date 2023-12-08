import 'dart:convert';

class Zones {
  String name;

  Zones({
    required this.name,
  });

  factory Zones.fromRawJson(String str) => Zones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zones.fromJson(Map<String, dynamic> json) => Zones(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
