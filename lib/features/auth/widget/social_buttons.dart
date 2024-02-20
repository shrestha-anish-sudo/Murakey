import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class Socailbutton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const Socailbutton(
      {super.key, required this.imagePath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.gray, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          imagePath,
          width: 90,
          height: 50,
        ),
      ),
    );
  }
}
