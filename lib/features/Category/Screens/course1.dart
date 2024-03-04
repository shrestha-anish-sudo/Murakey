import 'package:flutter/material.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/Category/Provider/categoryprovider.dart';
import 'package:murarkey/features/Category/Screens/mypopup_form.dart';
import 'package:murarkey/features/home/services/build_courses1.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/features/home/widgets/home_button.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class Courseone extends StatelessWidget {
  // void showForm(BuildContext context) {
  //   final formProvider = Provider.of<FormProvider>(context, listen: false);
  //   formProvider.toggleFormVisibility();
  // }

  const Courseone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.white),
                    ),
                    child: Image.asset(
                      c1,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        // Handle backward icon tap
                        Navigator.pop(context);
                      },
                      child: const Backarrow(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Self Makeup Course',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Duration: 7 days',
                          style: TextStyle(color: AppColor.gray),
                        ),
                      ],
                    ),
                    const SizedBox(width: 60),
                    Homebutton(
                      title: 'Fill the form',
                      onPress: () {
                        print('done');
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return MyPopupForm(
                              isVisible: true,
                              onSubmit: () {
                                // Handle form submission logic here
                                formProvider
                                    .toggleFormVisibility(); // Close the form
                                Navigator.pop(
                                    context); // Close the bottom sheet
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Course Descriptions',
                          style: TextStyle(
                            color: AppColor.gray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Get services from our experienced beautician for\nyour Hands, Feet, Nails, Face, Body, etc. Book a\nmurarkey beautician to come to you. Spoil\nyourself every once in a while, you deserve it.',
                          style: TextStyle(color: AppColor.gray),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Related Course',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 300,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildcourses1(context, 'Course 1', c2, 'Popular', () {}),
                    buildcourses1(context, 'Course 2', c2, 'Top Rated', () {}),
                    buildcourses1(
                      context,
                      'Course 3',
                      c2,
                      'Top Rated',
                      () {},
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
