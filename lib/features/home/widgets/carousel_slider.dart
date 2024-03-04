import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:murarkey/features/home/provider/home_provider.dart';
import 'package:murarkey/features/home/services/build_product.dart';
import 'package:provider/provider.dart';

class Carouselslider extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: false,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              Provider.of<IconButtonVisibilityNotifier>(context, listen: false)
                  .updateVisibility(index == 2);
            },
          ),
          items: [
            buildProductItem(
                context, 'Product 1', 'assets/product1.jpg', 'Popular', () {}),
            buildProductItem(context, 'Product 2', 'assets/product2.jpg',
                'Top Rated', () {}),
            buildProductItemWithButton(context, 'Product 3',
                'assets/product3.jpg', 'Top Rated', () {}),
            // Add more product items as needed
          ],
        ),
        Consumer<IconButtonVisibilityNotifier>(
          builder: (context, notifier, _) {
            return Visibility(
              visible: notifier.isIconButtonVisible,
              child: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  // Handle the button press
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
