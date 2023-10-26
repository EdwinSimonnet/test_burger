import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_burger/constants.dart';
import 'package:test_burger/models/basket.dart';
import 'package:test_burger/models/item.dart';
import 'package:test_burger/service_locator.dart';
import 'package:test_burger/services/api_service.dart';
import 'package:test_burger/widgets/item_menu_list_view.dart';

// Page menu
// Charge les items par appel d'API et les affichent
// Propose de recharger la page en cas d'erreur avec l'API
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = locator.get<ApiService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('$appTitle : Notre menu'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, basketRoute);
                },
                child: const Icon(Icons.shopping_basket),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Item>>(
          future: apiService.fetchItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> items = snapshot.data!;
              return ItemMenuListView(
                  items: items,
                  addAction: (Item item) {
                    Provider.of<Basket>(context, listen: false).add(item);
                    final snackBar = SnackBar(
                      content: Text("${item.title} ajouté au panier !"),
                      action: SnackBarAction(
                        label: 'Annuler',
                        onPressed: () {
                          Provider.of<Basket>(context, listen: false).remove(item);
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Une erreur s'est produite..."),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, menuRoute);
                    },
                    child: const Text('Recharger la page'),
                  )
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
