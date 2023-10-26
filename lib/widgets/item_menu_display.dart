import 'package:flutter/material.dart';
import 'package:test_burger/models/item.dart';
import 'package:test_burger/widgets/item_details.dart';
import 'package:test_burger/widgets/rounded_display.dart';
import 'package:test_burger/widgets/url_image.dart';

// Widget pour afficher un item dans le menu (image + détails + bouton ajout panier)
// Item à fournir
// Préciser l'action en cas d'ajout
class ItemMenuDisplay extends StatelessWidget {
  final Item item;
  final Function(Item) addAction;

  const ItemMenuDisplay({super.key, required this.item, required this.addAction});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: RoundedDisplay(
            child: Container(
              color: Colors.white,
              height: screenHeight / 5,
              width: screenWidth * 0.95,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(width: screenWidth * 0.55, child: ItemDetails(item: item)),
                UrlImage(url: item.thumbnailUrl, dimension: screenWidth * 0.25)
              ]),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: ElevatedButton(
            onPressed: () {
              addAction(item);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
