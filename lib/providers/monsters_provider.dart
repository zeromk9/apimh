import 'dart:convert';

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

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Imprimir la respuesta JSON en la consola
/*         print('Respuesta JSON de la API:');
        print(response.body); */

        final List<dynamic> jsonResponse = json.decode(response.body);
        final monsterInfo = Response.fromJson(jsonResponse);

        onDisplayMonsters = monsterInfo.info;

        notifyListeners();
      } else {
        // Si la solicitud no fue exitosa, imprimir el código de estado
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (error /*, stackTrace*/) {
      print('Error: $error');
/*       print('StackTrace: $stackTrace');
      print('JSON de la respuesta:'); */
    }
  }
}
