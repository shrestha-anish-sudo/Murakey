import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<String> items = [];

  void addToCart(String productName) {
    items.add(productName);
    notifyListeners();
  }

  void removeItem(String productName) {
    items.remove(productName);
    notifyListeners();
  }
}

class QuantityModel extends ChangeNotifier {
  int quantity = 1;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }
}
class Quantityprovider extends ChangeNotifier {
  int quantity = 1;

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }
}

