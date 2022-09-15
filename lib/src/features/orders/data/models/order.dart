// To parse this JSON data, do
//
//     final orders = ordersFromMap(jsonString);

import 'dart:convert';

class Order {
  Order(
      {required this.id,
      required this.destLat,
      required this.destLng,
      required this.driverId,
      required this.storeId,
      this.createdAt,
      this.updatedAt,
      required this.description,
      required this.price,
      required this.storeName,
      required this.storeLat,
      required this.storeLng});

  int id;
  double destLat;
  double destLng;
  int driverId;
  int storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String description;
  int price;
  double storeLat;
  double storeLng;
  String storeName;

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"],
        destLat: json["dest_lat"].toDouble(),
        destLng: json["dest_lng"].toDouble(),
        driverId: json["driver_id"],
        storeId: json["store_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        description: json["description"],
        price: json["price"],
        storeName: json["store"]["name"],
        storeLat: json["store"]["lat"],
        storeLng: json["store"]["lng"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "dest_lat": destLat,
        "dest_lng": destLng,
        "driver_id": driverId,
        "store_id": storeId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description,
        "price": price,
      };
}
