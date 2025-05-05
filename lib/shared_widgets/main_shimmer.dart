import 'package:flutter/material.dart';
import 'package:oxygen_loans/shared_widgets/shimmer_loader.dart';
import 'package:sizer/sizer.dart';

class MainShimmer extends StatelessWidget {
  const MainShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerLoader(
            width: 90.w, height: 2.h, borderRadius: BorderRadius.circular(4.w)),
        SizedBox(height: 2.h),
        ShimmerLoader(
            width: 59.w, height: 2.h, borderRadius: BorderRadius.circular(4.w)),
        SizedBox(height: 2.h),
        ShimmerLoader(
            width: 80.w, height: 5.h, borderRadius: BorderRadius.circular(4.w)),
        SizedBox(height: 2.h),
        ShimmerLoader(
            width: 90.w, height: 2.h, borderRadius: BorderRadius.circular(4.w)),
        SizedBox(height: 2.h),
        ShimmerLoader(
            width: 59.w, height: 2.h, borderRadius: BorderRadius.circular(4.w)),
        SizedBox(height: 2.h),
      ],
    );
  }
}
