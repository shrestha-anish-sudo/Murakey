import 'package:flutter/material.dart';
import 'package:murarkey/Utils/utils.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;

  const PasswordTextField(
      {super.key,
      required this.passwordController,
      required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    final passwordVisibilityNotifier = Provider.of<Passwordvisibility>(context);

    return SizedBox(
      height: 30,
      child: TextFormField(
        // controller: widget.passwordController,
        // focusNode: widget.passwordFocusNode,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          prefixIcon: Icon(Icons.security_outlined),
          suffixIcon: InkWell(
            onTap: () {
              passwordVisibilityNotifier.togglePasswordVisibility();
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
            Utils.toastMessage('Password must be at least 8 characters');
          }
          return null;
        },
      ),
    );
  }
}
