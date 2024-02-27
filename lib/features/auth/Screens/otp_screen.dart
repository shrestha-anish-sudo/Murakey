import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/routes_name.dart';
import 'package:murarkey/features/auth/widget/otp_textfield.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'OTP Verification',
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          OtpTextField(onChanged: (p0) {}, index: 12),
          const SizedBox(height: 30),
          RoundButton(title: 'Verify', onPress: () {})
        ],
      ),
    );
  }
}
