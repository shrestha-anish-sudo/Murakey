import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

Widget buildServiceItem(
  String name,
  String price,
  String imagePath,
) {
  return Expanded(
    child: Container(
      height: 240,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.white12.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4), // Only bottom shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Product Image
          Container(
            height: 140.0,
            width: double.infinity, // Set the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Favorite Icon
          Positioned(
            top: 8.0,
            right: 15.0,
            child: GestureDetector(
              onTap: () {
                // favoriteProvider.toggleFavorite(productId);
              },
              child: const CircleAvatar(
                radius: 14,
                backgroundColor: AppColor.white,
                child: Icon(
                  Icons.favorite_outline_outlined,
                  // favoriteProvider.isFavorite(productId)
                  //     ? Icons.favorite
                  //     : Icons.favorite_border,
                  color: AppColor.black,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150.0,
                // width: 20,
              ), // Spacer to position text below the image

              // Product Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, color: AppColor.gray),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),

              // Product Pricing
              Text(
                price,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.black),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
