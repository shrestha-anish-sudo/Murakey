import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';

class ImageGridView extends StatelessWidget {
  final List<String> images = [
    i1,
    i2,
    i3,
    i4,
    i5,
    i6,
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns in the grid
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Image.asset(
          images[index],
          fit: BoxFit.cover, // Adjust the BoxFit as needed
        );
      },
    );
  }
}
