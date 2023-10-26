import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_burger/constants.dart';
import 'package:test_burger/models/item.dart';

class ItemBasketDisplay extends StatelessWidget {
  final Item item;
  final int quantity;
  final Function(Item) removeAction;

  const ItemBasketDisplay({super.key, required this.item, this.quantity = 0, required this.removeAction});

  @override
  Widget build(BuildContext context) {
    final priceFormatter = NumberFormat.simpleCurrency(locale: countryCode);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("$quantity x   "),
            Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(" (${priceFormatter.format(item.getPrice())})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ))
          ],
        ),
        IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            removeAction(item);
          },
        )
      ],
    );
  }
}
