import 'package:flutter/material.dart';

class Passwordvisibility with ChangeNotifier {
  bool _obscurePassword = true;
  bool _isvisible = true;

  bool get obscurePassword => _obscurePassword;
  bool get isvisible => _isvisible;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleVisibility() {
    _isvisible = !_isvisible;
    notifyListeners();
  }
}
