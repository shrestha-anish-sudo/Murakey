import 'package:flutter/material.dart';
import 'package:murarkey/features/Cart/Screens/cart_screen.dart';
import 'package:murarkey/features/Course/Screens/course_screen.dart';
import 'package:murarkey/features/Mainscreen/Provider/tabprovider.dart';
import 'package:murarkey/features/home/screens/home_screens.dart';
import 'package:murarkey/features/profile/services/Screens/services_screen.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatelessWidget {
  final List<Widget> _pages = [
    Homescreen(),
    const Coursescreen(),
    const Servicesscreen(),
    const CartScreen(),
    const CartScreen(),
  ];

  Mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      body: PageView(
        controller: PageController(),
        children: _pages,
        onPageChanged: (index) {
          tabProvider.setIndex(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabProvider.currentIndex,
        selectedItemColor: AppColor.black,
        unselectedItemColor: AppColor.gray,
        onTap: (index) {
          tabProvider.setIndex(index);
        },
        items: [
          buildBottomNavigationBarItem(Icons.home_outlined, 'Home'),
          buildBottomNavigationBarItem(Icons.school_outlined, 'Course'),
          buildBottomNavigationBarItem(
            Icons.person_2_outlined,
            'Service',
            isCircleAvatar: true,
          ),
          buildBottomNavigationBarItem(Icons.shopping_cart_outlined, 'Cart'),
          buildBottomNavigationBarItem(Icons.favorite_outline, 'Favorite'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
    IconData icon,
    String label, {
    bool isCircleAvatar = false,
  }) {
    return BottomNavigationBarItem(
      icon: isCircleAvatar
          ? CircleAvatar(
              radius: 15,
              backgroundColor: AppColor.lightPurple,
              child: Icon(
                icon,
                color: AppColor.white,
              ),
            )
          : Icon(
              icon,
              color: AppColor.black,
            ),
      label: label,
    );
  }
}
