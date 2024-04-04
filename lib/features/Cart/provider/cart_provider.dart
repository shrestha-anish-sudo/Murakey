import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<String> items = [];

  void addToCart(String productName) {
    items.add(productName);
    notifyListeners();
  }


}