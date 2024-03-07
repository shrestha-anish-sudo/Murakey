import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:murarkey/features/home/Models/servicesmodel.dart';

class FeaturedServices {
  static Future<ServicesModel> fetchServicesData() async {
    try {
      final response =
          await http.get(Uri.parse('http://192.168.1.24:8000/api/v1/services'));
      if (response.statusCode == 200) {
        return ServicesModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('API returned an error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
