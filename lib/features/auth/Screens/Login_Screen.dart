import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/res/components/Roundbutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _obsecurepassword.dispose();
    _passwordController.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Welcome back! Glad to see you, Again!'),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneFocusNode,
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
                              width: 8),
                        ],
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, _phoneFocusNode, _passwordFocusNode);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter phone number';
                      } else if (!RegExp(r'^(\+977|0|98)([1-9]\d{8})$')
                          .hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: _obsecurepassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecurepassword.value,
                        focusNode: _passwordFocusNode,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (value!.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  RoundButton(
                    title: 'Login',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RoutesName.Home);
                        print('Api hit');
                      }
                    },
                  ),
                  const SizedBox(height: .2),
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
