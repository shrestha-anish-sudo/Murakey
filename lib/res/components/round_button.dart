import 'package:flutter/material.dart';
import 'package:murarkey/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: SingleChildScrollView(
        child: Container(
          height: 60,
          width: 400,
          decoration: BoxDecoration(
              color: AppColor.lightPurple,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(
                        color: AppColor.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
