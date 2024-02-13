abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String url, data);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
