import 'package:flutter/material.dart';
import 'package:test_burger/models/item.dart';
import 'package:test_burger/widgets/item_basket_display.dart';

// Widget affichant une liste scrollable d'items pour le panier (item + quantité)
// Map à fournir
class ItemBasketListView extends StatelessWidget {
  final Map<Item, int> itemsQuantities;
  final Function(Item) removeAction;

  const ItemBasketListView({super.key, required this.itemsQuantities, required this.removeAction});

  @override
  Widget build(BuildContext context) {
    List<Item> items = itemsQuantities.keys.toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: ItemBasketDisplay(
          item: items[index],
          quantity: itemsQuantities[items[index]]!, // on est sûr car ça vient des clés récupérées
          removeAction: removeAction,
        ));
      },
    );
  }
}
