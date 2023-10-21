import 'package:apimh/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MonstersProvider extends ChangeNotifier {
  final String _baseUrl = 'mhw-db.com';

  List<Monster> onDisplayMonsters = [];

  MonstersProvider() {
    getMonsterInfo();
  }

  getMonsterInfo() async {
    String monsters = 'monsters';
    var url = Uri.https(_baseUrl, monsters);
    final response = await http.get(url);

    final monsterinfo = Monster.fromRawJson(response.body);
    onDisplayMonsters = monsterinfo as List<Monster>;

    notifyListeners();
  }
}
