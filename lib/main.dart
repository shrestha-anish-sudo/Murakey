import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/features/auth/provider/LoginProvider.dart';
import 'package:murarkey/features/home/provider/Home_provider.dart';
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
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          // Add other providers as needed
        ],
        child: MaterialApp(
          title: 'Your App Name',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutesName.Login,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
