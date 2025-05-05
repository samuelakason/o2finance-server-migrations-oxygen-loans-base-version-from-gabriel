import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReviewBox extends StatelessWidget {
  const ReviewBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
          ),
          SizedBox(height: 1.h),
          Container(
            width: 100.w,
            padding: EdgeInsets.all(4.7.w),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(3.w)),
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
            ),
          ),
        ],
      )),
    );
  }
}
