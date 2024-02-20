import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesName.welcome);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        splash,
        fit: BoxFit.contain,
      ),
    );
  }
}
