import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// DateProvider Class
class DateProvider with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void handleDatePicker(BuildContext context) async {
    TextEditingController _dateController = TextEditingController();

    final DateFormat _dateformatter = DateFormat('MMM dd, yyyy');

    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (date != null && date != selectedDate) {
      updateDate(date);
      _dateController.text = _dateformatter.format(date);
    }
  }
}

// BottomNavigationBarProvider Class

class BottomNavigationBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
