import 'package:flutter/material.dart';
import 'package:murarkey/features/auth/widget/otp_textfield.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Backarrow(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OTP Verification',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Enter the verification code we just sent\non your Phone Number.',
                          style: TextStyle(color: AppColor.gray, fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OtpTextField(onChanged: (p0) {}, index: 12),
                    OtpTextField(onChanged: ((p0) {}), index: 12),
                    OtpTextField(onChanged: (p0) {}, index: 12),
                    OtpTextField(onChanged: ((p0) {}), index: 12),
                  ],
                ),
              ),
              // const SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RoundButton(title: 'Verify', onPress: () {}),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Did't recieved a code?",
                    style: TextStyle(
                        color: AppColor.gray, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ROu)
                      // Navigator.pushNamed(
                      //     context,
                      //     RoutesName
                      //     ); // Use Navigator.pop without any arguments
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
