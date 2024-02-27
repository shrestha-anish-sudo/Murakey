import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  Set<String> _favorites = {};

  Set<String> get favorites => _favorites;

  bool isFavorite(String serviceId) {
    return _favorites.contains(serviceId);
  }

  void toggleFavorite(String serviceId) {
    if (_favorites.contains(serviceId)) {
      _favorites.remove(serviceId);
    } else {
      _favorites.add(serviceId);
    }
    notifyListeners();
  }
}
