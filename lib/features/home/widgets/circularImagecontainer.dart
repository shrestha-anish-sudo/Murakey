import 'package:flutter/material.dart';

class CircularConatainer extends StatelessWidget {
  String image
  const CircularConatainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('<https://example.com/image.jpg>'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
