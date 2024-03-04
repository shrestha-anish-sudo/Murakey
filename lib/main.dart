import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Routes/routes.dart';
import 'package:murarkey/features/Cart/provider/cart_provider.dart';
import 'package:murarkey/features/Category/Provider/categoryprovider.dart';
import 'package:murarkey/features/auth/provider/auth_provider.dart';
import 'package:murarkey/features/auth/provider/login_provider.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:murarkey/features/home/provider/favroite_provider.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:murarkey/features/home/provider/product_provider.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // getIt.registerLazySingleton<AuthRepository>(() => AuthHttpApiRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
          ChangeNotifierProvider(
              create: (_) => Loginprovider(authRepository: getIt())),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => Passwordvisibility()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider()),
          ChangeNotifierProvider(create: (_) => TabSelectionNotifier()),
          ChangeNotifierProvider(create: (_) => ImageEnlargeNotifier()),
          ChangeNotifierProvider(create: (_) => ImageGalleryState()),
          ChangeNotifierProvider(create: (_) => IconButtonVisibilityNotifier()),
          ChangeNotifierProvider(create: (_) => FormProvider()),

          // Add other providers as needed
        ],
        child: MaterialApp(
          title: 'Murarkey',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
