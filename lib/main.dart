import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Routes/routes.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:murarkey/features/auth/provider/auth_provider.dart';
import 'package:murarkey/features/auth/provider/login_provider.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DateProvider()),
          ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
          ChangeNotifierProvider(create: (_) => Loginprovider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => Passwordvisibility()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          // Add other providers as needed
        ],
        child: MaterialApp(
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
