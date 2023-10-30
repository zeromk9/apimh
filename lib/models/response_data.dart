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

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      monsters:
          List<Monster>.from(json['monsters'].map((x) => Monster.fromJson(x))),
      armors: List<Armors>.from(json['armors'].map((x) => Armors.fromJson(x))),
      items: List<Items>.from(json['items'].map((x) => Items.fromJson(x))),
      weapons:
          List<Weapons>.from(json['weapons'].map((x) => Weapons.fromJson(x))),
      zones: List<Zones>.from(json['zones'].map((x) => Zones.fromJson(x))),
    );
  }
}
