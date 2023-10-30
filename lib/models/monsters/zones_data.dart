import 'dart:convert';

class Zones {
  int id;
  int zoneCount;
  String name;
  List<Camp> camps;

  Zones({
    required this.id,
    required this.zoneCount,
    required this.name,
    required this.camps,
  });

  factory Zones.fromRawJson(String str) => Zones.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Zones.fromJson(Map<String, dynamic> json) => Zones(
        id: json["id"],
        zoneCount: json["zoneCount"],
        name: json["name"],
        camps: List<Camp>.from(json["camps"].map((x) => Camp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zoneCount": zoneCount,
        "name": name,
        "camps": List<dynamic>.from(camps.map((x) => x.toJson())),
      };
}

class Camp {
  int id;
  int zone;
  String name;

  Camp({
    required this.id,
    required this.zone,
    required this.name,
  });

  factory Camp.fromRawJson(String str) => Camp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Camp.fromJson(Map<String, dynamic> json) => Camp(
        id: json["id"],
        zone: json["zone"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "zone": zone,
        "name": name,
      };
}
