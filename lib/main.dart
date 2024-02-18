import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:murarkey/features/auth/provider/LoginProvider.dart';
import 'package:murarkey/features/home/provider/Home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
        providers: [
          ChangeNotifierProvider(create: (_) => DateProvider()),
          ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          // Add other providers as needed
        ],
        child: MaterialApp(
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutesName.Home,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
