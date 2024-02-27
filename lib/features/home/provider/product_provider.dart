import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void nextPage(int totalProducts) {
    if (_currentPage < totalProducts - 1) {
      _currentPage++;
      notifyListeners();
    }
  }
}
