import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.hint,
    required this.controller,
    this.onChanged,
  }) : super(key: key);
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      onChanged: onChanged,
      style: TextStyle(
          color: Colors.black,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
      decoration: InputDecoration(
        prefixIcon: Icon(
          CupertinoIcons.search,
          color: Colors.grey,
          size: 12.sp,
        ),
        filled: true,
        fillColor: Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 0.h),
        labelText: hint,
        labelStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(4.w),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(2.w),
        ),
      ),
    );
  }
}
