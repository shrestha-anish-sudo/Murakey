import 'package:flutter/material.dart';

class TabSelectionNotifier extends ChangeNotifier {
  int _selectedIndex = 0;
  int _selectedIndex1 = 0;

  int get selectedIndex => _selectedIndex;
  int get selectedIndex1 => _selectedIndex1;

  void setTabIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setTabIndex1(int index1) {
    _selectedIndex1 = index1;
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

class ImageGalleryState extends ChangeNotifier {
  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void moveToNext(List<String> images) {
    if (currentIndex < images.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }

  void moveToPrevious() {
    if (currentIndex > 0) {
      currentIndex--;
      notifyListeners();
    }
  }
}
