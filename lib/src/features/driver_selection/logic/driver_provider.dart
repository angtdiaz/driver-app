import 'dart:convert';

import 'package:driver_app/src/features/driver_selection/data/models/driver.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DriverProvider extends ChangeNotifier {
  final String _urlBase = 'localhost:8000';

  List<Driver> drivers = [];
  bool loading = false;
  Driver? driver;

  DriverProvider() {
    print("Inicializado");
    getDrivers();
  }

  getDrivers() async {
    print("Inicializado");
    loading = true;
    var url = Uri.http(_urlBase, '/api/drivers');
    final response = await http.get(url);
    drivers = List<Driver>.from(
        json.decode(response.body).map((x) => Driver.fromMap(x)));
    loading = false;
    notifyListeners();
  }

  setDriver(Driver driver) {
    this.driver = driver;
    notifyListeners();
  }
}
