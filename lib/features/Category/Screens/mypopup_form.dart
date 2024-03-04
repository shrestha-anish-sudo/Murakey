import 'package:flutter/material.dart';
import 'package:murarkey/features/home/widgets/course_button.dart';
import 'package:murarkey/res/colors.dart';

class MyPopupForm extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onSubmit;
  MyPopupForm({
    required this.isVisible,
    required this.onSubmit,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: AppColor.gray,
                labelText: 'Full Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!value.contains('@')) {
                  return 'Invalid email format';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Message',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              // No validation for the Message field
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CourseButton(
                  title: 'Submit Form',
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, handle submission
                      // For now, you can add your logic here
                      Navigator.pop(context); // Close the form
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showMyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyPopupForm(
          isVisible: true,
          onSubmit: () {},
        );
      },
    );
  }
}
