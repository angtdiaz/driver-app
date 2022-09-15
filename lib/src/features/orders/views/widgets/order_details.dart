import 'package:flutter/material.dart';

import '../../data/models/order.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order ${order.id}",
                      style: Theme.of(context).textTheme.headline1),
                  const Text("")
                ],
              ),
            ),
            Text(
              order.description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  const Icon(Icons.store_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      order.storeName.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Origen",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "lat: ${order.storeLat.toStringAsFixed(3)} lng:${order.storeLng.toStringAsFixed(3)}")
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Destino",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "lat: ${order.destLat.toStringAsFixed(3)} lng:${order.destLng.toStringAsFixed(3)}")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
