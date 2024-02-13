import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/res/Colors.dart';
import 'package:murarkey/features/home/services/Home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();

    TextEditingController _dateController = TextEditingController();

    final DateFormat _dateformatter = DateFormat('MMM dd, YYYY');
    void _handleDatePicker(
        BuildContext context, DateProvider dateProvider) async {
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
      }
    }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
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
            const SizedBox(height: 16),
            Container(
              height: 200,
              // Add banner widget to display custom images or videos
            ),
            const SizedBox(height: 16),
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
                TextFormField(
                  readOnly: true,
                  controller: _dateController,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  onTap: () => (context, dateProvider),
                  decoration: InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            ),
            // Add functionality for date selection
            const SizedBox(height: 16),
            const Text('Recommended Services', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: AppColor.Darkblue),
              child: Text(
                'See all Services',
              ),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],

        // destinations: const [
        //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        //   NavigationDestination(icon: Icon(Icons.trolley), label: "Cart"),
        //   NavigationDestination(
        //       icon: Icon(Icons.category_outlined), label: "Services"),
        //   NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        // ],
        // onDestinationSelected: (int selected) {
        //   // _controller.jumpToPage(selected);
        //   switch (selected) {
        //     case 0:
        //       Navigator.pushNamed(context, RoutesName.Home);
        //       break;
        //     case 1:
        //       Navigator.pushReplacementNamed(context, RoutesName.Cart);
        //       break;
        //     case 2:
        //       Navigator.pushNamed(context, RoutesName.Services);
        //       break;
        //     case 3:
        //       Navigator.pushNamed(context, RoutesName.Profile);
        //       break;
        //   }
        // },
      ),
    );
  }
}
