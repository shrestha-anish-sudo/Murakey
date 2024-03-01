import 'package:flutter/material.dart';

class Backarrow extends StatelessWidget {
  const Backarrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Icon(Icons.arrow_back_ios_new)),
    );
  }
}
