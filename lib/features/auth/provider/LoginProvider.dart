import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider extends ChangeNotifier {
  
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void handleFacebookSignIn() async {
    final result = await _facebookLogin.logIn(customPermissions: ['email']);
    switch (result.status) {
      case FacebookLoginStatus.success:
        // Perform signup with Facebook
        print('Sign up with Facebook');
        break;
      case FacebookLoginStatus.cancel:
        print('Facebook login cancelled by user');
        break;
      case FacebookLoginStatus.error:
        print('Error signing up with Facebook: ${result.error}');
        break;
    }
  }

  void handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // Perform signup with Google
      print('Sign up with Google');
    } catch (error) {
      print('Error signing up with Google: $error');
    }
  }
}
