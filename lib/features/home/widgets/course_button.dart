import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class CourseButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const CourseButton({
    Key? key, // Added 'key' parameter
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 110,
        decoration: BoxDecoration(
          color: AppColor.lightPurple,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
