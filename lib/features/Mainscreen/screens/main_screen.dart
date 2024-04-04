import 'package:flutter/material.dart';
import 'package:murarkey/features/Cart/Screens/cart_screen.dart';
import 'package:murarkey/features/Course/Screens/course_screen.dart';
import 'package:murarkey/features/Mainscreen/Provider/tabprovider.dart';
import 'package:murarkey/features/home/screens/home_screens.dart';
import 'package:murarkey/features/profile/screens/Profile_screens.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getWidgetForIndex(context),
      bottomNavigationBar: ClipPath(
        // clipper: BNBCustomClipper(),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1.0, color: Colors.grey), // Add the border here
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: context.watch<NavigationProvider>().selectedIndex,
            onTap: (index) {
              context.read<NavigationProvider>().setIndex(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColor.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.school_outlined,
                  color: AppColor.black,
                ),
                label: 'Courses',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  color: AppColor.black,
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.black,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColor.black,
                ),
                label: 'Favourites',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getWidgetForIndex(BuildContext context) {
    final index = context.watch<NavigationProvider>().selectedIndex;
    switch (index) {
      case 0:
        return Homescreen();
      case 1:
        return Coursescreen();
      case 2:
        return CartSection();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}

class BNBCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()..moveTo(0, 0);
    path.lineTo(0, size.height - 20); // Top left corner
    path.quadraticBezierTo(size.width * .20, size.height, size.width * .20,
        size.height); // Top curve
    path.quadraticBezierTo(size.width * .25, size.height, size.width * .25,
        size.height - 20); // Top right corner
    path.lineTo(size.width * .75, size.height - 20); // Bottom right corner
    path.quadraticBezierTo(size.width * .80, size.height, size.width,
        size.height - 20); // Bottom curve
    path.lineTo(size.width, 0); // Bottom right corner
    path.lineTo(0, 0); // Bottom right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
