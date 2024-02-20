import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/Roundbutton.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Text(
                'Don\'t worry! It happens. Please enter the\nphone number linked with your account.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.gray,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(
                title: 'Send Code',
                onPress: () {
                  // Add the logic for sending the code
                },
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Remember Password?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Use Navigator.pop without any arguments
                    },
                    child: const Text(
                      'Login',
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
