import 'dart:convert';

class Armors {
  String name;

  Armors({
    required this.name,
  });

  factory Armors.fromRawJson(String str) => Armors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Armors.fromJson(Map<String, dynamic> json) => Armors(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
