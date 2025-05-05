import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class SuccessSheet extends StatelessWidget {
  const SuccessSheet({Key? key, required this.text, required this.callback})
      : super(key: key);
  final String text;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Icon(CupertinoIcons.xmark),
          // )
          SizedBox(height: 2.h),
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Theme.of(context).primaryColor,
            size: 20.h,
          ),
          SizedBox(height: 2.h),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 12.sp),
          ),
          SizedBox(height: 2.h),
          MainButton(title: "Proceed", callback: callback)
        ],
      ),
    );
  }
}

class SuccessSheet2 extends StatelessWidget {
  const SuccessSheet2(
      {Key? key,
      required this.text,
      required this.callback,
      required this.token})
      : super(key: key);
  final String text, token;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: [
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Icon(CupertinoIcons.xmark),
          // )
          SizedBox(height: 2.h),
          Icon(
            CupertinoIcons.check_mark_circled_solid,
            color: Theme.of(context).primaryColor,
            size: 20.h,
          ),
          SizedBox(height: 2.h),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 12.sp),
          ),

          Text(
            token,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 2.h),
          MainButton(title: "Proceed", callback: callback)
        ],
      ),
    );
  }
}
