import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/utils.dart';
import 'package:murarkey/repository/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  bool _isRegistered = false;
  bool get isRegistered => _isRegistered;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;

  setPassword(String password) {
    _password = password;
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;

  setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.LoginApi(data).then((value) {
      setLoading(false);
      setLoggedIn(true); // User logged in successfully
      Utils.snackBar('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpapi(data).then((value) {
      setSignUpLoading(false);
      Utils.snackBar('Sign Up Successfully', context);
      Navigator.pushNamed(context, RoutesName.login);
      if (kDebugMode) {
        print(value.toString());
      }
    }).catchError((error) {
      setSignUpLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print("======");
        print(error.toString());
        print("======");
      }
    });
  }

  Future<void> forgotPassword(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.forgotpasswordApi(data).then((value) {
      setLoading(false);

      Utils.snackBar('OTP sent successfully', context);
      Navigator.pushNamed(context, RoutesName.otpscreen);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.snackBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
