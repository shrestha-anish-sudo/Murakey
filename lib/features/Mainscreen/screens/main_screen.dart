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
        clipper: ShapeBorderClipper(
          shape: UShapeBorder(),
        ),
        child: Container(
          decoration: BoxDecoration(
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: AppColor.black,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: AppColor.black,
                ),
                label: 'Courses',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColor.black,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColor.black,
                ),
                label: 'Profile',
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
        return CartScreen();
      case 3:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}

class UShapeBorder extends ShapeBorder {
  const UShapeBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left, rect.bottom - 20); // U shape indentation
    path.quadraticBezierTo(
        rect.width / 2, rect.bottom, rect.right, rect.bottom - 20);
    path.lineTo(rect.right, rect.top);
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return UShapeBorder();
  }
}
