import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Monster {
  String species;
  String name;
  String description;

  Monster({
    required this.species,
    required this.name,
    required this.description,
  });

  factory Monster.fromRawJson(String str) => Monster.fromJson(json.decode(str));

  factory Monster.fromJson(Map<String, dynamic> json) => Monster(
        species: json["species"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "species": species,
        "name": name,
        "description": description,
      };

  Future<String?> getImagePath(String imageName) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    String imagePath = '$appDocPath/imgs/monsters/$imageName.jpg';

    if (await File(imagePath).exists()) {
      return imagePath;
    } else {
      return null;
    }
  }

  Future<bool> doesImageExist() async {
    String? imagePath = await getImagePath(name);
    return imagePath != null && File(imagePath).existsSync();
  }
}
