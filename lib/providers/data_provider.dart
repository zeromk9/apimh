// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:apimh/models/models.dart';

class DataProvider extends ChangeNotifier {
  final String _baseUrl = 'mhw-db.com';

  List<Monster> onDisplayMonsters = [];
  List<Armors> onDisplayArmors = [];
  List<Items> onDisplayItems = [];
  List<Zones> onDisplayZones = [];
  List<Weapons> onDisplayWeapons = [];

  Future<void> getMonsters() async {
    await getData();
  }

  Future<void> getArmors() async {
    await getData(endpoint: 'armor/sets');
  }

  Future<void> getItems() async {
    await getData(endpoint: 'items');
  }

  Future<void> getZones() async {
    await getData(endpoint: 'locations');
  }

  Future<void> getWeapons() async {
    await getData(endpoint: 'weapons');
  }

  Future<void> getData(
      {String endpoint = 'monsters', List<String>? names}) async {
    var url = Uri.https(_baseUrl, endpoint);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final responseData = Response.fromJson(jsonResponse);

        if (endpoint == 'monsters') {
          onDisplayMonsters = responseData.monsters
              .where((monster) => names?.contains(monster.name) ?? true)
              .toList();
        } else if (endpoint == 'armor/sets') {
          onDisplayArmors = responseData.armors;
        } else if (endpoint == 'items') {
          onDisplayItems = responseData.items;
        } else if (endpoint == 'locations') {
          onDisplayZones = responseData.zones;
        } else if (endpoint == 'weapons') {
          onDisplayWeapons = responseData.weapons;
        }

        notifyListeners();
      } else {
        print('Error en la solicitud: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
