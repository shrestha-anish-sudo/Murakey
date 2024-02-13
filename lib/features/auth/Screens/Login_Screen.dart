import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:murarkey/features/auth/Services/LoginProvider.dart';
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

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FacebookLogin _facebookLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  setState(() {
                    _phoneNumber = number.phoneNumber!;
                    _countryCode = number.dialCode!;
                  });
                },
                inputDecoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
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
                child: Text('Login'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _handleGoogleSignIn,
                child: Text('Sign Up with Google'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _handleFacebookSignIn,
                child: Text('Sign Up with Facebook'),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void _handleFacebookSignIn() async {
    final result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.:
        // Perform signup with Facebook
        print('Sign up with Facebook');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Facebook login cancelled by user');
        break;
      case FacebookLoginStatus.error:
        print('Error signing up with Facebook: ${result.error}');
        break;
    }
  }
}
