import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader(
      {Key? key,
      required this.width,
      required this.height,
      required this.borderRadius})
      : super(key: key);
  final double width, height;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Get.isDarkMode ? Colors.white30 : Colors.grey,
      child: Container(
        margin: EdgeInsets.only(right: 0),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Get.isDarkMode ? Colors.white30 : Colors.black26,
        ),
      ),
    );
  }
}
