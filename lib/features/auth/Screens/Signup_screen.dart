import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:murarkey/features/auth/widget/password_text_field.dart';
import 'package:murarkey/features/auth/widget/social_buttons.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/Roundbutton.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final passwordVisibilityNotifier = Provider.of<Passwordvisibility>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: 13,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black, // Set your desired color
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! Sign up to\nget started',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      focusNode: _nameFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.flushBarErrorMessage(
                            'please enter you username', context);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage('Please enter your full name');
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      focusNode: _phoneFocusNode,
                      decoration: InputDecoration(
                        hintText: '(+977)',
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              nepalFlagImage,
                              height: 40,
                              width: 40,
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                          context,
                          _phoneFocusNode,
                          _passwordFocusNode,
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter phone number', context);
                        } else if (!RegExp(r'^(\+977|0|98)([1-9]\d{8})$')
                            .hasMatch(value)) {
                          Utils.toastMessage(
                              'Please enter a valid phone number');
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: PasswordTextField(
                      passwordController: _passwordController,
                      passwordFocusNode: _passwordFocusNode,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      focusNode: _confirmPasswordFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: const Icon(Icons.security_outlined),
                        suffixIcon: InkWell(
                          onTap: () {
                            passwordVisibilityNotifier.toggleVisibility();
                          },
                          child: Icon(passwordVisibilityNotifier.isvisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage('Please enter confirm password');
                        } else if (value != _passwordController.text) {
                          Utils.toastMessage('Passwords do not match');
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                    title: 'SignUp',
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RoutesName.login);
                        print('Api hit');
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Or Sign Up with',
                    style: TextStyle(
                      color: AppColor.gray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Socailbutton(imagePath: facebook, onPressed: () {}),
                      Socailbutton(imagePath: google, onPressed: () {}),
                      Socailbutton(imagePath: apple, onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Already have an account?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
