import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/res/components/Roundbutton.dart';

class SignUp extends StatelessWidget {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  FocusNode PhoneFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context)
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.numberWithOptions(),
              focusNode: PhoneFocusNode,
              decoration: InputDecoration(
                hintText: 'Phone Number (+977)',
                labelText: 'Phone Number',
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      nepalFlagImage,
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                        width:
                            8), // Adjust the spacing between the flag and the text field
                    const Icon(Icons.phone_android_outlined),
                  ],
                ),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, PhoneFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(),
                    ),
                  );
                }),
            const SizedBox(height: 10),
            RoundButton(
                title: 'Sign Up',
                onPress: () {
                  if (_phoneController.text.isEmpty) {
                    Utils.toastMessage('Please enter phone Number');
                  } else if (_phoneController.text.length < 10) {
                    Utils.toastMessage('please enter 10 digit Phone Number');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage('please enter password');
                  } else if (_passwordController.text.length < 8) {
                    Utils.snackBar('Please enter 8 digit password', context);
                  } else {
                    print('Api hit');
                    Navigator.pushNamed(context, RoutesName.Login);
                  }
                }),
            const SizedBox(height: .2),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.SignUP);
              },
              child: Text('Go to SignIN'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  icon: const Icon(Icons.facebook),
                  label: const Text('Login with Facebook'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Gmail login
                  },
                  icon: const Icon(Icons.mail),
                  label: const Text('Login with Gmail'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Handle sign up
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
