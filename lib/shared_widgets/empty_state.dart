import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key, required this.desc, this.height})
      : super(key: key);
  final String desc;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 4.h),
        Image.asset(
          "assets/images/undraw_Modern_design_re_dlp8.png",
          height: height ?? 20.h,
        ),
        SizedBox(height: 2.h),
        Text(
          desc,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 11.sp,
              ),
        ),
      ]),
    );
  }
}
