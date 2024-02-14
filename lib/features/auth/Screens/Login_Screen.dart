import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:murarkey/features/auth/provider/LoginProvider.dart';
import 'package:murarkey/features/auth/widget/Phone_number_input.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _countryCode = '';

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookLogin facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Login',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 16),
                    PhoneNumberInput(
                      controller: _phoneNumberController,
                      onInputChanged: (PhoneNumber number){

                      },
                       inputDecoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                    ),
              
                  
                    const SizedBox(height: 16),
                    // Password TextFormField and Forgot Password button
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement your forgot password logic here
                            print('Forgot Password pressed');
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login with _phoneNumber and _passwordController.text
                          print('Login pressed');
                          print('Phone Number: $_countryCode$_phoneNumber');
                          print('Password: ${_passwordController.text}');
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        loginProvider.handleGoogleSignIn();
                      },
                      child: const Text('Sign Up with Google'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        loginProvider.handleFacebookSignIn();
                      },
                      child: const Text('Sign Up with Facebook'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
