import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murarkey/features/Slider/Model/slidermodel.dart';
import 'package:murarkey/res/app_url.dart';

class SliderService {
  static Future<CarouselItem> fetchCarouselData() async {
    try {
      var response = await http.get(
        Uri.parse(AppUrl.sliderapi),
      );

      if (response.statusCode == 200) {
        // Parse the response body, not the headers
        var jsonData = json.decode(response.body);
        return CarouselItem.fromJson(jsonData);
      } else {
        // Handle non-200 status code, throw an exception, or return a default value
        throw Exception('Failed to load carousel data');
      }
    } catch (e) {
      // Handle other errors, throw an exception, or return a default value
      throw Exception('Failed to load carousel data');
    }
  }
}
