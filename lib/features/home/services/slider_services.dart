import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murarkey/Data/app_exceptions.dart';
import 'package:murarkey/features/home/Models/slidermodel.dart';
import 'package:murarkey/res/app_url.dart';

// class ApiDataException implements Exception {
//   final String message;
//   ApiDataException(this.message);
// }

class SliderService {
  static Object? get object => null;

  static Future<CarouselItem> fetchCarouselData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.sliderapi));
      if (response.statusCode == 200) {
        return CarouselItem.fromJson(jsonDecode(response.body));
      } switch (response.statusCode) {
        case 200:
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        case 400:
          throw BadRequestException(response.body.toString());
        case 500:
        case 404:
          throw UnauthorisedException(response.body.toString());
        default:
          throw FetchDataException(
              'Error occured while communicating with server');
      }
    } catch (e) {
      throw BadRequestException(Error.safeToString(object));
    }
  }
}
