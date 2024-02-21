import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            widthFactor: 13,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.forgotpassword);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black, // Set your desired color
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
