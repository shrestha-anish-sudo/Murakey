import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/Cart/Screens/cart_screen.dart';
import 'package:murarkey/features/Category/Screens/category_screen.dart';
import 'package:murarkey/features/Category/Screens/course1.dart';
import 'package:murarkey/features/Category/Screens/course2.dart';
import 'package:murarkey/features/Mainscreen/screens/main_screen.dart';
import 'package:murarkey/features/auth/Screens/Login_Screen.dart';
import 'package:murarkey/features/auth/Screens/Signup_screen.dart';
import 'package:murarkey/features/auth/Screens/create_new.dart';
import 'package:murarkey/features/auth/Screens/forgotpassword_screen.dart';
import 'package:murarkey/features/auth/Screens/otp_screen.dart';
import 'package:murarkey/features/auth/Screens/password_changed.dart';
import 'package:murarkey/features/auth/Screens/welcome_screen.dart';
import 'package:murarkey/features/auth/splash/splash_screen.dart';
import 'package:murarkey/features/home/Products/product_one.dart';
import 'package:murarkey/features/home/Products/product_three.dart';
import 'package:murarkey/features/home/Products/product_two.dart';
import 'package:murarkey/features/home/screens/home_screen1.dart';
import 'package:murarkey/features/home/screens/home_screens.dart';
import 'package:murarkey/features/profile/screens/Profile_screens.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return _pageRoute(Homescreen());
      case RoutesName.login:
        return _pageRoute(LoginScreen());
      case RoutesName.cart:
        return _pageRoute(CartSection());
      case RoutesName.services:
        return _pageRoute(const ProfileScreen());
      case RoutesName.signup:
        return _pageRoute(SignUp());
      case RoutesName.splash:
        return _pageRoute(const SplashScreen());
      case RoutesName.forgotpassword:
        return _pageRoute(const Forgotpassword());
      case RoutesName.welcome:
        return _pageRoute(const Welcomescreen());
      case RoutesName.otpscreen:
        return _pageRoute(const Otpscreen());
      case RoutesName.category:
        return _pageRoute(const Categoryscreen());
      case RoutesName.courseone:
        return _pageRoute(const Courseone());
      case RoutesName.coursetwo:
        return _pageRoute(const Coursetwo());
      case RoutesName.createnew:
        return _pageRoute(const Createnew());
      case RoutesName.Passwordchanged:
        return _pageRoute(const Passwordchanger());
      case RoutesName.mainscreen:
        return _pageRoute(const Mainscreen());
      case RoutesName.home1:
        return _pageRoute(Homescreen1());
      case RoutesName.naill:
        return _pageRoute(Productone());
      case RoutesName.mani:
        return _pageRoute(Producttwo());
      case RoutesName.wax:
        return _pageRoute(Productthree());

      // case RoutesName.mainscreen:
      // return _pageRoute(Mainscreen());
    }
    return null;
  }
}

PageRoute _pageRoute(Widget viewToShow) {
  return MaterialPageRoute(builder: (_) => viewToShow);
}
