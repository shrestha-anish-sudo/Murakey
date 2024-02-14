import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/Cart/Screens/Cart_screen.dart';
import 'package:murarkey/features/auth/Screens/Login_Screen.dart';
import 'package:murarkey/features/profile/screens/Profile_screens.dart';
import 'package:murarkey/features/auth/Screens/Signup_screen.dart';
import 'package:murarkey/features/home/screens/home_screens.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.Home:
        return MaterialPageRoute(builder: (BuildContext) => HomeScreen());
      case RoutesName.Login:
        return MaterialPageRoute(builder: (BuildContext) => LoginPage());
      case RoutesName.Cart:
        return MaterialPageRoute(builder: (BuildContext) => CartScreen());
      case RoutesName.Services:
        return MaterialPageRoute(builder: (BuildContext) => ProfileScreen());
      case RoutesName.SignUP:
        return MaterialPageRoute(builder: (BuildContext) => SignUp());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
