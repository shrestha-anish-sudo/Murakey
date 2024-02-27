import 'package:flutter/material.dart';

class TabSelectionNotifier extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setTabIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
class ImageEnlargeNotifier extends ChangeNotifier {
  bool _isImageEnlarged = false;

  bool get isImageEnlarged => _isImageEnlarged;

  void toggleImageSize() {
    _isImageEnlarged = !_isImageEnlarged;
    notifyListeners();
  }
}
class BottomNavigationBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
