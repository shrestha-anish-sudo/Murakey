import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/auth/provider/auth_provider.dart';
import 'package:murarkey/features/auth/widget/password_text_field.dart';
import 'package:murarkey/features/auth/widget/social_buttons.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authview = Provider.of<AuthProvider>(context);
    // final loginview = Provider.of<Loginprovider>(context);

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Welcome back! Glad\nto see you, Again!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneFocusNode,
                    decoration: InputDecoration(
                      hintText: '(+977)',
                      fillColor: AppColor.gray,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            nepalFlagImage,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.flushBarErrorMessage(
                            'Please enter phone number', context);
                      } else if (!RegExp(r'^(\+977|0|98)([1-9]\d{8})$')
                          .hasMatch(value)) {
                        Utils.snackBar(
                            'Please enter a valid phone number', context);
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: PasswordTextField(
                    passwordController: _passwordController,
                    passwordFocusNode: _passwordFocusNode,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          print('okay');
                          Navigator.pushNamed(
                              context, RoutesName.forgotpassword);
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: AppColor.gray,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                const SizedBox(height: 20),
                RoundButton(
                  title: 'Login',
                  loading: authview.loading,
                  onPress: () {
                    if (!_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RoutesName.home);
                      print('Api hit');
                    } else {
                      Map data = {
                        'phoneNumber': _phoneController.toString(),
                        'password': _passwordController.toString(),
                      };
                      authview.loginApi(data, context).then((value) {
                        Navigator.pushNamed(context, RoutesName.home);
                      }).onError((error, stackTrace) {
                        Utils.flushBarErrorMessage(error.toString(), context);
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                const Text(
                  'Or Login with',
                  style: TextStyle(
                    color: AppColor.gray,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Socailbutton(imagePath: facebook, onPressed: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    Socailbutton(imagePath: google, onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 105),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: AppColor.gray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signup);
                      },
                      child: const Text(
                        'Sign Up',
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
    ));
  }
}
