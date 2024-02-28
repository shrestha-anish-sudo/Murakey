import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';

Widget buildCategoryItem(
  String imagePath,
  String buttonTitle,
  VoidCallback onPressed,
) {
  return Expanded(
    child: Container(
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white24.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Category Image
          Container(
            height: 140.0,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150.0),

              // Enquiry Button
              Align(
                alignment: Alignment.topLeft,
                child: Homebutton(title: buttonTitle, onPress: onPressed),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
