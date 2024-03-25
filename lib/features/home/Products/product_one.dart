import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/Colors.dart';

class Productone extends StatelessWidget {
  const Productone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(children: [
                // Image at top left corner
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 3, 8, 0),
                  child: Container(
                    height: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(color: AppColor.black)),
                    child: Image.asset(
                      p1, // Replace with your image path
                      fit: BoxFit.fill, // Adjust height as needed
                    ),
                  ),
                ),
                // Back button icon (assuming it's a custom component)
                Positioned(
                  top: 15, // Adjust top position as needed
                  left: 35, // Adjust left position as needed
                  child: Backarrow(), // Replace with your back button component
                ),
              ]),
              SizedBox(
                height: 0.5,
              ),
              Container(
                height: 300,
                width: 200,
                padding: const EdgeInsets.all(16), // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Change color as needed
                  borderRadius: BorderRadius.circular(
                      20), // Adjust border radius as needed
                  border: Border.all(
                    color: Colors.grey, // Change border color as needed
                    width: 1, // Adjust border width as needed
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Nail Extension',
                      style: TextStyle(
                          fontSize: 16,
                          color:
                              AppColor.lightPurple // Adjust font size as needed
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
