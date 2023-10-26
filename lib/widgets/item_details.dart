import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_burger/constants.dart';
import 'package:test_burger/models/item.dart';

// Widget affichant les détails d'un item
// Item à fournir
class ItemDetails extends StatelessWidget {
  final Item item;

  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final priceFormatter = NumberFormat.simpleCurrency(locale: countryCode);

    // Vide si pas de description
    List<Widget> descriptionWidgets = [];
    if (item.description != null) {
      descriptionWidgets.add(const Divider(thickness: 3));
      // TODO max lines à 3, faire un (...) et développer ou ouvrir une nouvelle page pour voir le reste
      descriptionWidgets.add(Text(item.description ?? '', textAlign: TextAlign.center, maxLines: 3));
    }

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      Text(priceFormatter.format(item.getPrice()),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          )),
      ...descriptionWidgets
    ]);
  }
}
