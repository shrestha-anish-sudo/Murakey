import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/Cart/Screens/Cart_screen.dart';
import 'package:murarkey/features/Category/Screens/category_screen.dart';
import 'package:murarkey/features/auth/Screens/Login_Screen.dart';
import 'package:murarkey/features/auth/Screens/Signup_screen.dart';
import 'package:murarkey/features/auth/Screens/forgotpassword_screen.dart';
import 'package:murarkey/features/auth/Screens/otp_screen.dart';
import 'package:murarkey/features/auth/Screens/welcome_screen.dart';
import 'package:murarkey/features/auth/splash/splash_screen.dart';
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
        return _pageRoute(const CartScreen());
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
    }
    return null;
  }
}

PageRoute _pageRoute(Widget viewToShow) {
  return MaterialPageRoute(builder: (_) => viewToShow);
}
