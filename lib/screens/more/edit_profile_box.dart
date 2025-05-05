import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EditProfileBox extends StatelessWidget {
  const EditProfileBox(
      {Key? key,
      required this.ctrl,
      required this.title,
      required this.isEditable})
      : super(key: key);
  final TextEditingController ctrl;
  final String title;
  final bool isEditable;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 11.sp,
                fontFamily: "Muli",
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: ctrl,
            enabled: isEditable,
            obscureText: false,
            style: TextStyle(
                color: Colors.black,
                fontSize:
                    SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
              labelText: title,
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
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
