import 'package:driver_app/src/core/widgets/order_card.dart';
import 'package:driver_app/src/features/orders/data/models/order.dart';
import 'package:driver_app/src/features/orders/logic/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orders = [];
  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    final String driverId =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-driver";

    Provider.of<OrderProvider>(context, listen: false)
        .getOrdersByDriver(int.parse(driverId));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: FutureBuilder(
        future: orderProvider.getOrdersByDriver(int.parse(driverId)),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Order>> snapshot,
        ) {
          List<Widget> children;
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderCard(order: snapshot.data![index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
