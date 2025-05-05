import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({Key? key, required this.text, required this.time})
      : super(key: key);
  final String text, time;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF808080).withOpacity(0.4)),
                borderRadius: BorderRadius.circular(3.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: TextStyle(
                        fontSize: 9.sp,
                        color: Color(0xFF808080).withOpacity(0.7)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
