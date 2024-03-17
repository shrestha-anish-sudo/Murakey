import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            girl,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 410,
            left: 120,
            child: Image.asset(
              logo,
              height: 160,
              width: 160,
            ),
          ),
          Positioned(
            top: 590,
            left: 16,
            right: 16,
            child: RoundButton(
                title: 'Login',
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.login);
                }),
          ),
          Positioned(
            top: 670,
            left: 16,
            right: 16,
            child: Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signup);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: AppColor.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 770,
              left: 124,
              right: 50,
              child: InkWell(
                onTap: () {
                  print("guest");
                  Navigator.pushNamed(context, RoutesName.mainscreen);
                },
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
