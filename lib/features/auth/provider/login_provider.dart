import 'package:flutter/material.dart';
import 'package:murarkey/features/auth/model/user_model.dart';
import 'package:murarkey/repository/auth_repository.dart';

class Loginprovider with ChangeNotifier {

  AuthRepository authRepository;
  
  Loginprovider({required this.authRepository});

  // Creating getter method to store the value of the input phone number
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  // Creating getter method to store the value of the input password
  String _password = '';
  String get password => _password;

  setPassword(String password) {
    _password = password;
  }

  // Future<UserModel> loginApi(dynamic data) async {
  //   try {
  //     setLoginLoading(true);
  //     final response = await authRepository.LoginApi(data);
  //     // await SessionController().saveUserInPreference(Fresponse);
  //     // await SessionController().getUserFromPreference();
  //     setLoginLoading(false);
  //     return response;
  //   } catch (e) {
  //     setLoginLoading(false);
  //     throw Exception(e);
  //   }
  // }
}


