import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/home/provider/Home_provider.dart';
import 'package:murarkey/res/Colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();

    TextEditingController _dateController = TextEditingController();

    final DateFormat _dateformatter = DateFormat('MMM dd, YYYY');

    final dateProvider = Provider.of<DateProvider>(context);
    final bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Darkblue,
        title: Text(
          'Murarkey',
          style: TextStyle(fontSize: 20, color: AppColor.white),
        ),
        // title: Image.asset('assets/company_logo.png', height: 30),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.Cart);
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search services and products',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            // Add functionality for searching
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,

            // Add banner widget to display custom images or videos
          ),
          const SizedBox(height: 10),
          const Center(
              child:
                  Text('Service Categories', style: TextStyle(fontSize: 18))),
          // Add ListView for service categories
          const SizedBox(height: 16),
          const Center(child: Text('Cities', style: TextStyle(fontSize: 18))),
          // Add GridView for cities
          const SizedBox(height: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () => (context, dateProvider),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      Text(
                        'Date wise Service details',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 10),
                      Text(
                        _dateController.text.isNotEmpty
                            ? _dateController.text
                            : _dateformatter.format(dateProvider.selectedDate),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Add functionality for date selection
          const SizedBox(height: 10),
          const Text('Recommended Services', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: AppColor.Darkblue),
            child: Text(
              'See all Services',
            ),
          ),
        ],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
