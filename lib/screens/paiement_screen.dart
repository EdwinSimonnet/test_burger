import 'package:flutter/material.dart';
import 'package:test_burger/constants.dart';

// Page paiement
//TODO
class PaiementScreen extends StatelessWidget {
  const PaiementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$appTitle : Paiement'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, menuRoute);
                },
                child: const Icon(Icons.restaurant_menu),
              ))
        ],
      ),
      body: const Center(child: Text("Page en cours de création...")),
    );
  }
}
