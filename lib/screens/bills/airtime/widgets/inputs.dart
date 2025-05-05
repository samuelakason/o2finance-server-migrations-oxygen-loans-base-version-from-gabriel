import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AirtimeInput extends StatelessWidget {
  const AirtimeInput(this.title, this.controller, this.hint, this.isObscure,
      {Key? key})
      : super(key: key);
  final String title;
  final TextEditingController controller;
  final String hint;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          style: TextStyle(
              color: Colors.grey,
              fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
            labelText: hint,
            labelStyle: TextStyle(
                fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
            fillColor: Color(0xFF0f1245),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(2.w),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.9),
              borderRadius: BorderRadius.circular(2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.9),
              borderRadius: BorderRadius.circular(2.w),
            ),
          ),
        ),
        SizedBox(height: 0.5.h),
      ],
    );
  }
}
