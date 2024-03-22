import 'package:flutter/material.dart';
import 'package:murarkey/Utils/Routes/Routes_name.dart';
import 'package:murarkey/Utils/Utils.dart';
import 'package:murarkey/Utils/constant/assets_path.dart';
import 'package:murarkey/features/auth/provider/auth_provider.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
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
    final authview = Provider.of<AuthProvider>(context);

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
                        hintText: 'Full Name',
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
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        prefixIcon: Icon(Icons.security_outlined),
                        suffixIcon: InkWell(
                          onTap: () {
                            passwordVisibilityNotifier
                                .togglePasswordVisibility();
                          },
                          child: Icon(passwordVisibilityNotifier.obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: passwordVisibilityNotifier.obscurePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessage('Please enter a password');
                        } else if (value.length < 8) {
                          Utils.toastMessage(
                              'Password must be at least 8 characters');
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
                    title: 'Sign Up',
                    loading: authview
                        .signUpLoading, // Assuming you have signUpLoading property in your AuthProvider
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        print("mydata");
                        Map data = {
                          'Full Name': _nameController.text,
                          'phoneNumber': _phoneController.text,
                          'password': _passwordController.text,
                          'confirmPassword': _confirmPasswordController.text,
                        };

                        authview.signUpApi(data, context).then((value) {
                          if (authview.isRegistered) {
                            // Navigate to appropriate screen after successful signup
                            Navigator.pushNamed(context, RoutesName.login);
                          } else {
                            Utils.flushBarErrorMessage(
                                'Sign Up failed', context);
                          }
                        }).catchError((error) {
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
