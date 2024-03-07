import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murarkey/features/home/Models/slidermodel.dart';
import 'package:murarkey/res/app_url.dart';

class ApiDataException implements Exception {
  final String message;
  ApiDataException(this.message);
}

class SliderService {
  static Future<CarouselItem> fetchCarouselData() async {
    try {
      final response = await http.get(Uri.parse(AppUrl.sliderapi));
      if (response.statusCode == 200) {
        return CarouselItem.fromJson(jsonDecode(response.body));
      } else {
        throw ApiDataException('API returned an error: ${response.statusCode}');
      }
    } catch (e) {
      throw ApiDataException('Failed to load Carousel data: $e');
    }
  }
}
