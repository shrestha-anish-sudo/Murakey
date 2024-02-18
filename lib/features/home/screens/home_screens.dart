import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/provider/Home_provider.dart';
import 'package:murarkey/res/Colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();

    TextEditingController _dateController = TextEditingController();

    final DateFormat _dateformatter = DateFormat('MMM dd, yyyy');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        // Add other providers if needed
      ],
      child: Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavigationBarProvider, _) {
          final dateProvider = Provider.of<DateProvider>(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.Darkblue,
              title: Text(
                'Murarkey',
                style: TextStyle(fontSize: 20, color: AppColor.white),
              ),
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
            body: Padding(
              padding: const EdgeInsets.all(10),
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
                  const SizedBox(height: 10),
                  Container(
                    color: AppColor.Darkblue,
                    height: 130,
                    // Add banner widget to display custom images or videos
                  ),
                  const SizedBox(height: 10),
                  const Center(child: Text('Service Categories')),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        Image.asset(
                          nepalFlagImage,
                          height: 40,
                          width: 40,
                        ),
                      )),
                  const SizedBox(height: 16),
                  Container(
                    height: 50,
                    width: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.Darkblue,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Date wise Service details :',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          _dateController.text.isNotEmpty
                              ? _dateController.text
                              : _dateformatter
                                  .format(dateProvider.selectedDate),
                          style: TextStyle(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            dateProvider.handleDatePicker(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.Darkblue,
                                  width: 1), // Adjust border width as needed
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the circular radius as needed
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Services'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
