// To parse this JSON data, do
//
//     final driver = driverFromMap(jsonString);

import 'dart:convert';

class Driver {
  Driver({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  double lat;
  double lng;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Driver.fromJson(String str) => Driver.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Driver.fromMap(Map<String, dynamic> json) => Driver(
        id: json["id"],
        name: json["name"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "lat": lat,
        "lng": lng,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
