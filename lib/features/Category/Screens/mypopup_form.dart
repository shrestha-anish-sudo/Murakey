import 'package:flutter/material.dart';
import 'package:murarkey/features/Category/Provider/categoryprovider.dart';
import 'package:murarkey/features/home/widgets/course_button.dart';
import 'package:murarkey/res/colors.dart';
import 'package:provider/provider.dart';

class MyPopupForm extends StatefulWidget {
  @override
  _MyPopupFormState createState() => _MyPopupFormState();
}

class _MyPopupFormState extends State<MyPopupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var formProvider = Provider.of<FormProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        bottom: formProvider.showForm ? 0 : -200,
        left: 0,
        right: 0,
        child: Container(
          height: 500,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      fillColor: AppColor.gray,
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
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
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
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
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
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
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
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
                            formProvider
                                .toggleFormVisibility(); // Close the form
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
