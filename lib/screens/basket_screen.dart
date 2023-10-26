import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test_burger/constants.dart';
import 'package:test_burger/models/basket.dart';
import 'package:test_burger/models/item.dart';
import 'package:test_burger/widgets/item_basket_list_view.dart';
import 'package:test_burger/widgets/rounded_display.dart';

// Page panier
class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final priceFormatter = NumberFormat.simpleCurrency(locale: countryCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('$appTitle : Votre panier'),
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
      body: Consumer<Basket>(builder: (context, basket, child) {
        return basket.isEmpty
            ? const Center(child: Text("Votre panier est vide"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    height: screenHeight * 0.6,
                    child: RoundedDisplay(
                        child: Container(
                            color: Colors.white,
                            child: ItemBasketListView(
                              itemsQuantities: basket.itemsQuantities,
                              removeAction: (Item item) {
                                basket.removeAll(item);
                              },
                            ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("TOTAL : ", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(priceFormatter.format(basket.totalPrice),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, paiementRoute);
                    },
                    child: const Text('Procéder au paiement'),
                  )
                ],
              );
      }),
    );
  }
}
