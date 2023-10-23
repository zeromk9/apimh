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
        print('Respuesta JSON de la API:');
        print(response.body);

        final monsterInfo = Response.fromRawJson(response.body);
        onDisplayMonsters = monsterInfo.info;
        notifyListeners();
      } else {
        // Si la solicitud no fue exitosa, imprimir el código de estado
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (error) {
      // Capturar y manejar cualquier excepción que ocurra durante la solicitud
      print('Error: $error');
    }
  }
}
