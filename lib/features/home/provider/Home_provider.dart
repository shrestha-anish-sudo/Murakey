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
class HomeProvider with ChangeNotifier{
  void handleDatePicker(BuildContext context, DateProvider dateProvider) async {
    final DateFormat _dateformatter = DateFormat('MMM dd, YYYY');

    TextEditingController _dateController = TextEditingController();
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: dateProvider.selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (date != null && date != dateProvider.selectedDate) {
      dateProvider.updateDate(date);
      _dateController.text = DateFormat('MMM dd, yyyy').format(date);
      _dateController.text = _dateformatter.format(date);
    }
  }
}

