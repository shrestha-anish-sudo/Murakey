import 'package:flutter/material.dart';

class Iconbutton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const Iconbutton({super.key,
  required this.title, this.loading= false,
  required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SingleChildScrollView(
        child: Container(
          height: 40,
          width: 50,
        ),
      ),






    );
  }
}
