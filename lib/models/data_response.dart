import 'dart:convert';
import 'package:apimh/models/models.dart';

class Response {
  List<Monster> info;

  Response({
    required this.info,
  });

  factory Response.fromRawJson(String str) =>
      Response.fromJson(json.decode(str));

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        info: List<Monster>.from(json["data"].map((x) => Monster.fromJson(x))),
      );
}
