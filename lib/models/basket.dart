import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:test_burger/models/item.dart';

class Basket extends ChangeNotifier {
  final Map<Item, int> _itemsQuantities = {};

  UnmodifiableMapView<Item, int> get itemsQuantities => UnmodifiableMapView(_itemsQuantities);

  double get totalPrice {
    double total = 0;
    for (Item item in _itemsQuantities.keys) {
      total = total + item.getPrice() * (_itemsQuantities[item]!); // on est sûr car ça vient des clés récupérées
    }
    return total;
  }

  bool get isEmpty {
    return _itemsQuantities.isEmpty;
  }

  void add(Item item) {
    _itemsQuantities.update(
      item,
      (value) => ++value,
      ifAbsent: () => 1,
    );
    notifyListeners();
  }

  void _safeRemove(Item item) {
    if (_itemsQuantities.containsKey(item)) {
      _itemsQuantities.remove(item);
    }
  }

  void remove(Item item) {
    _itemsQuantities.update(
      item,
      (value) => --value,
      ifAbsent: () => 0,
    );
    if (_itemsQuantities[item] == 1 || _itemsQuantities[item] == 0) {
      _safeRemove(item);
    }
    notifyListeners();
  }

  void removeAll(Item item) {
    _safeRemove(item);
    notifyListeners();
  }

  void clear() {
    _itemsQuantities.clear();
    notifyListeners();
  }
}
