import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/res/colors.dart';

class SLider extends StatelessWidget {
  final List<String> items = [
    slider,
    slider,
    slider,
    // Add more items as needed
  ];

  SLider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 130,
          // Set the desired height
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          viewportFraction: 0.8,
        ),
        items: items.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(slider, fit: BoxFit.cover),
                    Positioned(
                      top: 15,
                      bottom: 10,
                      left: 15,
                      child: Text(
                        'Our Popular\nProducts',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 15,
                      child: Text(
                        '10%',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 75,
                      left: 90,
                      child: Text(
                        'off',
                        style: TextStyle(color: AppColor.white),
                      ),
                    ),
                    Positioned(
                      top: 99,
                      left: 18,
                      child: Row(
                        children: [
                          Text(
                            'See all items',
                            style:
                                TextStyle(color: AppColor.white, fontSize: 10),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColor.white,
                            size: 16,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
