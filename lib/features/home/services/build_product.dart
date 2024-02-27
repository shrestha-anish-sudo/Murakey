import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';
import 'package:murarkey/res/colors.dart';

Widget buildProductItem(
    BuildContext context, String name, String imagePath, String topRightText) {
  return Container(
    // height: 500,
    width: 150.0, // Adjust the width as needed
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
          height: 140.0, // Set the height as needed
          decoration: BoxDecoration(
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
              const SizedBox(height: 8.0),

              // Product Pricing
              // Text(
              //   price,
              //   style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              // ),

              // Button
              const SizedBox(height: 8.0),
              Align(
                  alignment: Alignment.topLeft,
                  child: Homebutton(title: 'Learn More', onPress: () {}))
            ],
          ),
        ),
      ],
    ),
  );
}
