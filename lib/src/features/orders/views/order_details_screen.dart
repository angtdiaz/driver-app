import 'package:driver_app/src/features/driver_selection/logic/driver_provider.dart';
import 'package:driver_app/src/features/orders/data/models/order.dart';
import 'package:driver_app/src/features/orders/views/widgets/map_order.dart';
import 'package:driver_app/src/features/orders/views/widgets/order_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverProvider = Provider.of<DriverProvider>(context);

    Object order = ModalRoute.of(context)?.settings.arguments ?? Object();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.6,
            child: MapOrder(
              order: order as Order,
              driver: driverProvider.driver!,
            ),
          ),
          Expanded(
            child: OrderDetails(order: order),
          ),
        ],
      ),
    );
  }
}
