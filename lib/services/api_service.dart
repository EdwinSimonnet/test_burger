import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_burger/constants.dart';
import 'package:test_burger/models/item.dart';

// Service d'appel API
class ApiService {
  Future<List<Item>> fetchItems({bool testMode = false}) {
    if (testMode) {
      return Future.value([
        const Item(id: '1', title: "Burger A", priceInCents: 100),
        const Item(id: '2', title: "Burger B", priceInCents: 100),
        const Item(id: '3', title: "Burger C", priceInCents: 100),
      ]);
    }

    return http.get(Uri.parse(apiUrl)).then((response) {
      // OK
      if (response.statusCode == 200) {
        Iterable iterable = jsonDecode(response.body);
        List<Item> burgers = List<Item>.from(iterable.map((model) => Item.fromJson(model)));
        return burgers;
      }
      // Problème
      else {
        throw Exception('Failed to load items');
      }
    });
  }
}
