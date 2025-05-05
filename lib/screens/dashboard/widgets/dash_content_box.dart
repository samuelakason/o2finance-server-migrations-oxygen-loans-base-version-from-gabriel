import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class DashContentBoxes extends StatelessWidget {
  const DashContentBoxes(
      {Key? key,
      required this.title,
      required this.desc,
      required this.color,
      required this.callback,
      required this.bgColor,
      required this.svg})
      : super(key: key);

  final String title, desc;
  final Color color;
  final VoidCallback callback;
  final Color bgColor;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(0.5)),
          borderRadius: BorderRadius.all(Radius.circular(4.w)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.3), shape: BoxShape.circle),
              child: SvgPicture.asset(
                svg,
                height: 14.sp,
                color: bgColor,
              ),
            ),
            SizedBox(width: 4.w),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: SizerUtil.deviceType == DeviceType.mobile
                              ? 12.sp
                              : 9.sp,
                          color: Color(0xFF000000),
                        ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: SizerUtil.deviceType == DeviceType.mobile
                              ? 10.sp
                              : 7.sp,
                          color: Color(0xFF05242C).withOpacity(0.6),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
