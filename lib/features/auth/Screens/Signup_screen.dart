import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/auth/provider/auth_provider.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:murarkey/features/auth/widget/password_text_field.dart';
import 'package:murarkey/features/auth/widget/social_buttons.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';
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
    final authprovider = Provider.of<AuthProvider>(context);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: const Backarrow(),
                      ),
                    ],
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
                          fontSize: 28,
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
                        FocusScope.of(context).requestFocus(_phoneFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage('please enter your username');
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
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter phone number', context);
                        } else if (!RegExp(r'^(\+977|0|98)([1-9]\d{8})$')
                            .hasMatch(value)) {
                          return null;
                        } else {
                          Utils.toastMessage('Please enter valid Phone number');
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
                      obscureText: passwordVisibilityNotifier.isvisible,
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
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        // Construct the data map for signup
                        Map<String, dynamic> data = {
                          'phoneNumber': _phoneController.text,
                          'password': _passwordController.text,
                        };

                        // Access the AuthProvider using Provider.of
                        AuthProvider authProvider =
                            Provider.of<AuthProvider>(context, listen: false);

                        // Call the signUpApi method from the AuthProvider
                        await authProvider
                            .signUpApi(data, context)
                            .then((value) {
                          // Check if registration was successful before navigating to the login screen
                          if (authProvider.isRegistered) {
                            Navigator.pushNamed(context, RoutesName.login);
                          } else {
                            // Registration failed
                            Utils.flushBarErrorMessage(
                                'Sign up failed', context);
                          }
                        }).catchError((error) {
                          // Handle error during registration
                          Utils.flushBarErrorMessage(error.toString(), context);
                        });
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Socailbutton(imagePath: facebook, onPressed: () {}),
                      const SizedBox(width: 5),
                      Socailbutton(imagePath: google, onPressed: () {}),
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
