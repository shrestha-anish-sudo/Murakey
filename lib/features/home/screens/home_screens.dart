import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murarkey/features/home/provider/Home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();

    TextEditingController _dateController = TextEditingController();

    final DateFormat _dateformatter = DateFormat('MMM dd, YYYY');

    final bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);
    final dateProvider = Provider.of<DateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Selected Index: ${bottomNavigationBarProvider.selectedIndex}'),
            SizedBox(height: 20),
            Text(
                'Selected Date: ${_dateformatter.format(dateProvider.selectedDate)}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                dateProvider.handleDatePicker(context);
              },
              child: Text('Pick a Date'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          bottomNavigationBarProvider.updateSelectedIndex(value);
        },
        currentIndex: bottomNavigationBarProvider.selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Services'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
