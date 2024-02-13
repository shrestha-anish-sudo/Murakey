import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
   void _handleFacebookSignIn() async {
    final result = await _facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        // Perform signup with Facebook
        print('Sign up with Facebook');
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Facebook login cancelled by user');
        break;
      case FacebookLoginStatus.error:
        print('Error signing up with Facebook: ${result.errorMessage}');
        break;
    }
  }
  void _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Perform signup with Google
      print('Sign up with Google');
    } catch (error) {
      print('Error signing up with Google: $error');
    }
  }
}


