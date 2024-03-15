import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';

class Passwordchanger extends StatelessWidget {
  const Passwordchanger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Sucess,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Password Changed!',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColor.black),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Your Password has been\n   changed sucessfully',
              style: TextStyle(
                fontSize: 15,
                color: AppColor.gray,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RoundButton(
                title: 'Back to Login',
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.login);
                }),
          )
        ],
      ),
    );
  }
}
