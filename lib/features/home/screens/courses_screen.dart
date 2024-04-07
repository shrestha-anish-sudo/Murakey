import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/features/home/widgets/course_component.dart';

class AvailableCourse extends StatelessWidget {
  const AvailableCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Backarrow(),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Courses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CourseComponent(
                    imagePath: c1,
                    title: 'Self Makeup Course',
                    duration: '7 days',
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.courseone);
                    }),
                const SizedBox(
                  height: 5,
                ),
                CourseComponent(
                    imagePath: f2,
                    title: 'Bridal Makeup Course',
                    duration: '15 days',
                    onPressed: () {}),
                SizedBox(
                  height: 5,
                ),
                CourseComponent(
                    imagePath: p3,
                    title: 'Waxing COurse',
                    duration: '7 days',
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
