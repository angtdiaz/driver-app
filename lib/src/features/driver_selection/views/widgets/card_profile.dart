import 'package:driver_app/src/features/driver_selection/logic/driver_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/driver.dart';

class CardProfile extends StatelessWidget {
  final String imageUrl;

  final Driver driver;

  const CardProfile({
    Key? key,
    required this.imageUrl,
    required this.driver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Provider.of<DriverProvider>(context, listen: false)
                  .setDriver(driver);
              Navigator.pushNamed(context, "orders", arguments: driver.id);
            },
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              children: [
                Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Image(
                      image: AssetImage(imageUrl),
                      height: 100,
                      fit: BoxFit.cover,
                    )),
                Center(
                    child: Text(
                  driver.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
