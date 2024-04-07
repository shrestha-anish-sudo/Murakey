import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';
import 'package:murarkey/res/colors.dart';

Widget buildProductItem(BuildContext context, String name, String imagePath,
    String topRightText, VoidCallback onPressed) {
  return Container(
    // height: double.infinity,

    height: 240, // Adjust the width as needed
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        Container(
          height: 140.0,
          width: 175, // Set the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: AppColor.white,
                padding: const EdgeInsets.all(4),
                child: Text(
                  topRightText,
                  style: const TextStyle(color: AppColor.black, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   bottom: 8.0,
        //   right: 8.0,
        //   child: IconButton(
        //     icon: Icon(Icons.arrow_forward),
        //     onPressed: onPressed,
        //   ),
        // ),

        // Product Details
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Text
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              // Product Pricing
              // Text(
              //   price,
              //   style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              // ),

              // Button
              const SizedBox(height: 8.0),
              Align(
                  alignment: Alignment.topLeft,
                  child: Homebutton(title: 'Learn More', onPress: onPressed))
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildProductItemWithButton(BuildContext context, String name,
    String imagePath, String topRightText, VoidCallback onPressed) {
  CarouselController buttonCarouselController = CarouselController();
  CarouselController _carouselController = CarouselController();

  return Stack(
    children: [
      buildProductItem(context, name, imagePath, topRightText, onPressed),
      Positioned(
        top: 70,
        right: 50,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColor.white,
          child: IconButton(
            color: AppColor.black,
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}
