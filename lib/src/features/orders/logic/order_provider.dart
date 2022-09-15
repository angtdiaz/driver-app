import 'dart:convert';

import 'package:driver_app/src/features/orders/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderProvider extends ChangeNotifier {
  final String _urlBase = 'localhost:8000';

  List<Order> orders = [];
  bool loading = false;

  OrderProvider() {
    print("Inicializado");
  }

  Future<List<Order>> getOrdersByDriver(int id) async {
    loading = true;
    var url = Uri.http(_urlBase, '/api/drivers/$id');
    final response = await http.get(url);
    orders = List<Order>.from(
        json.decode(response.body).map((x) => Order.fromMap(x)));
    loading = false;
    return orders;
  }

  getOrders() {
    return orders;
  }
}
