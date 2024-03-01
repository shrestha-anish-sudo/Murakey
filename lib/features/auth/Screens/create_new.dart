import 'package:flutter/material.dart';
import 'package:murarkey/features/auth/provider/password_provider.dart';
import 'package:murarkey/features/home/widgets/back_arrow.dart';
import 'package:murarkey/res/colors.dart';
import 'package:murarkey/res/components/round_button.dart';
import 'package:provider/provider.dart';

class Createnew extends StatelessWidget {
  const Createnew({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

        final passwordVisibilityNotifier = Provider.of<Passwordvisibility>(context);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Backarrow(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your new password must be unique from\nthose previously used.',
                          style: TextStyle(color: AppColor.gray, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a new password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                   prefixIcon: const Icon(Icons.security_outlined),
                  suffixIcon: InkWell(
                    onTap: () {
                      passwordVisibilityNotifier.toggleVisibility();
                    },
                    child: Icon(passwordVisibilityNotifier.isvisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  ),
                ),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              RoundButton(title: 'Reset Password', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
