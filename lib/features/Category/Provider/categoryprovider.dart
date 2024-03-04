import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  bool _showForm = false;

  bool get showForm => _showForm;

  void toggleFormVisibility() {
    _showForm = !_showForm;
    notifyListeners();
  }
}
