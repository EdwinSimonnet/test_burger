import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_burger/models/basket.dart';
import 'package:test_burger/screens/basket_screen.dart';
import 'package:test_burger/screens/menu_screen.dart';
import 'package:test_burger/screens/paiement_screen.dart';
import 'package:test_burger/service_locator.dart';
import 'constants.dart';

Future<void> main() async {
  await setupServiceLocator();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Basket(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primaryColor,
          scaffoldBackgroundColor: secondaryColor,
        ),
        initialRoute: menuRoute,
        routes: {
          menuRoute: (context) => const MenuScreen(),
          basketRoute: (context) => const BasketScreen(),
          paiementRoute: (context) => const PaiementScreen(),
        });
  }
}
