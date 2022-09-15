import 'package:driver_app/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../features/orders/data/models/order.dart';

class OrderCard extends StatelessWidget {
  final TextStyle _bold = const TextStyle(fontWeight: FontWeight.bold);
  const OrderCard({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, "ordersDetails", arguments: order),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        minVerticalPadding: 5,
        leading: const Image(
          color: AppTheme.primary,
          image: AssetImage('assets/motorcycle.png'),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.home_outlined,
              color: AppTheme.primary,
            ),
            Text(
              order.storeName,
              style: _bold,
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppTheme.primary,
            ),
            Text(
                "Lat: ${order.storeLat.toStringAsFixed(3)} Lng: ${order.storeLng.toStringAsFixed(3)}"),
          ],
        ),
        trailing: Text(
          "\$${order.price}",
          style: _bold,
        ),
      ),
    );
  }
}
