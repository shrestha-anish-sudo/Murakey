import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:murarkey/features/home/Models/slidermodel.dart';

class Carousel extends StatelessWidget {
  Future<CarouselItem>? _futureCarouselItem;

  @override
  void initState() {
    _futureCarouselItem = fetchCarouselData();
  }

  Future<CarouselItem> fetchCarouselData() async {
    final response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
    if (response.statusCode == 200) {
      return CarouselItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load carousel data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CarouselItem>(
      future: _futureCarouselItem,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final carouselItem = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
            ),
            items: carouselItem.data!.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.network(item.image!, fit: BoxFit.cover),
                  );
                },
              );
            }).toList(),
          );
        }
      },
    );
  }
}
