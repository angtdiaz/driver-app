import 'package:driver_app/src/features/driver_selection/logic/driver_provider.dart';
import 'package:driver_app/src/features/driver_selection/views/driver_selection_screen.dart';
import 'package:driver_app/src/core/theme/app_theme.dart';
import 'package:driver_app/src/features/orders/logic/order_provider.dart';
import 'package:driver_app/src/features/orders/views/order_details_screen.dart';
import 'package:driver_app/src/features/orders/views/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DriverProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: 'home',
      routes: {
        'home': (_) => const DriverSelectionScreen(),
        'orders': (_) => const OrderScreen(),
        'ordersDetails': (_) => const OrderDetailsScreen()
      },
    );
  }
}
