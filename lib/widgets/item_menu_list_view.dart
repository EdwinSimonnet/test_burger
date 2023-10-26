import 'package:flutter/material.dart';
import 'package:test_burger/models/item.dart';
import 'package:test_burger/widgets/item_menu_display.dart';

// Widget affichant une liste scrollable d'items pour le menu
// Liste à fournir
// Préciser l'action en cas d'ajout
class ItemMenuListView extends StatelessWidget {
  final List<Item> items;
  final Function(Item) addAction;

  const ItemMenuListView({super.key, required this.items, required this.addAction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: ItemMenuDisplay(
          item: items[index],
          addAction: addAction,
        ));
      },
    );
  }
}
