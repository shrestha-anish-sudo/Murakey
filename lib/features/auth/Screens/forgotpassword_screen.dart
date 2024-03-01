import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/Utils/utils.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    final FocusNode _phoneFocusNode = FocusNode();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Backarrow(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Don\'t worry! It happens. Please enter the\nphone number linked with your account.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColor.gray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  focusNode: _phoneFocusNode,
                  decoration: InputDecoration(
                    hintText: '(+977)',
                    fillColor: AppColor.gray,
                    prefixIcon: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            nepalFlagImage,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // onFieldSubmitted: (value) {
                  //   Utils.fieldFocusChange(
                  //       context, _phoneFocusNode, _passwordFocusNode);
                  // },
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.toastMessage('Please enter phone number');
                    } else if (!RegExp(r'^(\+977|0|98)([1-9]\d{8})$')
                        .hasMatch(value)) {
                      return null;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundButton(
                  title: 'Send Code',
                  onPress: () {
                    print("OTP");
                    Navigator.pushNamed(context, RoutesName.otpscreen);
                  },
                ),
                const SizedBox(
                  height: 360,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Remember Password?',
                      style: TextStyle(
                          color: AppColor.gray, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            RoutesName
                                .login); // Use Navigator.pop without any arguments
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
      ),
    );
  }
}
