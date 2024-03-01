import 'package:flutter/material.dart';
import 'package:murarkey/features/Category/widget/category_button.dart';

Widget buildCategoryItem(
  String imagePath,
  String buttonTitle,
  VoidCallback onPressed,
) {
  return Expanded(
    child: Container(
      height: 290,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
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
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit
                    .cover, // Use BoxFit.fill to cover the entire container
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 95.0),

                // Enquiry Button
                Align(
                  alignment: Alignment.topLeft,
                  child: Categorybutton(title: buttonTitle, onPress: onPressed),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
