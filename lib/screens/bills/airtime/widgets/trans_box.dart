import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/dotted_lines.dart';
import 'package:sizer/sizer.dart';

class TransferRecBox extends StatelessWidget {
  const TransferRecBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 13.sp),
            ),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black, fontSize: 13.sp),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Container(
          height: 1,
          width: 100.w,
          color: Colors.grey.withOpacity(0.1),
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}
