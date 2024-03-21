import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:murarkey/features/Slider/Components/carousel_loading.dart';
import 'package:murarkey/features/home/Models/slidermodel.dart';
import 'package:murarkey/features/home/services/slider_services.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('API Hit');
    return FutureBuilder<CarouselItem>(
      future: SliderService.fetchCarouselData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CarouselLoading();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.data == null) {
          return Text('No data available');
        } else {
          return CarouselSlider(
            items: snapshot.data!.data!.map((data) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.network(data.image ?? ''),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 140,
              aspectRatio: 16 / 9,
              viewportFraction: 0.3,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
      },
    );
  }
}
