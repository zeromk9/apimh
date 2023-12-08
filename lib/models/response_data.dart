import 'package:apimh/models/models.dart';

class Response {
  List<Monster> monsters;
  List<Armors> armors;
  List<Items> items;
  List<Weapons> weapons;
  List<Zones> zones;

  Response({
    required this.monsters,
    required this.armors,
    required this.items,
    required this.weapons,
    required this.zones,
  });

  factory Response.fromJson(List<dynamic> json) {
    return Response(
      monsters: List<Monster>.from(json.map((x) => Monster.fromJson(x))),
      armors: List<Armors>.from(json.map((x) => Armors.fromJson(x))),
      items: List<Items>.from(json.map((x) => Items.fromJson(x))),
      weapons: List<Weapons>.from(json.map((x) => Weapons.fromJson(x))),
      zones: List<Zones>.from(json.map((x) => Zones.fromJson(x))),
    );
  }
}
