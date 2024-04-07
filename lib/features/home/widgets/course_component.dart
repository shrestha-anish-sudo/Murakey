import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';

class CourseComponent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final VoidCallback onPressed;

  const CourseComponent({
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Title and Duration
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Duration: $duration',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          // Enquire Now Button
          Homebutton(title: 'Enquiry', onPress: onPressed)
        ],
      ),
    );
  }
}
