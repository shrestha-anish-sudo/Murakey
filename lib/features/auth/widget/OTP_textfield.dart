import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.onChanged,
    required this.index,
  });
  final void Function(String)? onChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.sp),
      width: 40.sp,
      height: 40.sp,
      child: TextFormField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22.sp),
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: const BorderSide()),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: const BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: const BorderSide()),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.sp),
              borderSide: const BorderSide()),
        ),
      ),
    );
  }
}
