import 'package:flutter/material.dart';
import 'package:murarkey/res/Colors.dart';

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
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: AppColor.lightPurple,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: AppColor.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
