import 'package:flutter/material.dart';
import 'package:murarkey/Data/Network/base_api_services.dart';
import 'package:murarkey/Data/Network/network_api_services.dart';
import 'package:murarkey/features/auth/model/user_model.dart';
import 'package:murarkey/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiService();
  Future<UserModel> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
   Future<UserModel> SignupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerApiEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }

  }
  Future<void> forgotPassword(dynamic data) async {
    try {
      await _apiServices.getPostApiResponse(AppUrl.forgotPasswordEndpoint, data);
    } catch (e) {
      throw e;
    }
  }
}
 



