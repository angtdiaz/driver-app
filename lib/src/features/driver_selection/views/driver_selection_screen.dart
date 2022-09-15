import 'package:driver_app/src/features/driver_selection/logic/driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/card_profile.dart';

class DriverSelectionScreen extends StatefulWidget {
  const DriverSelectionScreen({Key? key}) : super(key: key);

  @override
  State<DriverSelectionScreen> createState() => _DriverSelectionScreenState();
}

class _DriverSelectionScreenState extends State<DriverSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<DriverProvider>(context);
    List<String> arrayImg = ["assets/banner1.jpg", "assets/banner2.jpg"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drivers"),
      ),
      body: driverProvider.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: driverProvider.drivers.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardProfile(
                      driver: driverProvider.drivers[index],
                      imageUrl: arrayImg[index % 2 != 0 ? 0 : 1]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
    );
  }
}
