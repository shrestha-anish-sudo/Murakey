import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class HomeIcon extends StatelessWidget {
  final IconData iconData;

  const HomeIcon({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.black,
        ),
      ),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.white,
        child: Icon(
          iconData,
          color: AppColor.gray, // Customize the icon color
        ),
      ),
    );
  }
}
