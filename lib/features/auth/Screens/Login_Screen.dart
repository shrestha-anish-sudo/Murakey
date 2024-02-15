import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/common_widgets/Spacing_widget.dart';
import 'package:murarkey/res/components/Roundbutton.dart';

class LoginPage extends StatelessWidget {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController _PhoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode PhoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  void dispose() {
    _PhoneController.dispose();
    _obsecurepassword.dispose();
    _passwordController.dispose();
    PhoneFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _PhoneController,
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
                    SizedBox(
                        width:
                            8), // Adjust the spacing between the flag and the text field
                    Icon(Icons.phone_android_outlined),
                  ],
                ),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, PhoneFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurepassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurepassword.value,
                    focusNode: passwordFocusNode,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: InkWell(
                          // onTap: () {
                          //  _obsecurepassword.value = !_obsecurepassword.value;
                          // }
                          // child: Icon(_obsecurepassword.value
                          //     ? Icons.visibility_off_outlined
                          //     : Icons.visibility),
                          ),
                    ),
                  );
                }),
            const AddSpacing(height: 10),
            RoundButton(
                title: 'Login',
                onPress: () {
                  if (_PhoneController.text.isEmpty) {
                    Utils.toastMessage('Please enter phone Number');
                  } else if (_PhoneController.text.length < 10) {
                    Utils.toastMessage('please enter 10 digit Phone Number');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage('please enter password');
                  } else if (_passwordController.text.length < 8) {
                    Utils.snackBar('Please enter 8 digit password', context);
                  } else {
                    print('Api hit');
                  }
                }),
            const AddSpacing(height: .2),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.SignUP);
              },
              child: Text('Don/t have an account? Sign Up'),
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
                const AddSpacing(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Gmail login
                  },
                  icon: const Icon(Icons.mail),
                  label: const Text('Login with Gmail'),
                ),
              ],
            ),
            const AddSpacing(height: 20),
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
