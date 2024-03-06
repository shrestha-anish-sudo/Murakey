// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:murarkey/features/Cart/Screens/cart_screen.dart';
// import 'package:murarkey/features/Course/Screens/course_screen.dart';
// import 'package:murarkey/features/Mainscreen/Provider/tabprovider.dart';
// import 'package:murarkey/features/home/screens/home_screens.dart';
// import 'package:murarkey/features/profile/services/Screens/services_screen.dart';
// import 'package:murarkey/res/colors.dart';
// import 'package:provider/provider.dart';

// class Mainscreen extends StatelessWidget {
//   final List<Widget> _pages = [
//     Homescreen(),
//     const Coursescreen(),
//     const Servicesscreen(),
//     const CartScreen(),
//     const CartScreen(),
//   ];

//   Mainscreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final tabProvider = Provider.of<TabProvider>(context);

//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.shifting,
//         showSelectedLabels: false,
//         elevation: 1.5,
//         currentIndex: currentScreenIndex,
//         onTap: (value) =>
//         _screenindexprovider.updateScfreenIndex(value),
//         items: [
//           BottomNavigationBarItem(icon: Icon(current))
//         ]
//         ,

//       ),
//     );
//   }
// }