import 'package:murarkey/Data/Network/base_api_services.dart';
import 'package:murarkey/Data/Network/network_api_services.dart';
import 'package:murarkey/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> LoginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpapi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.registerApiEndpoint);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
