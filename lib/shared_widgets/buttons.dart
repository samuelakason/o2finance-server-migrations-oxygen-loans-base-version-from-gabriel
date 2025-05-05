import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.title, required this.callback})
      : super(key: key);
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 11.sp, color: Colors.white)),
        ),
      ),
    );
  }
}

class RealestateButton extends StatelessWidget {
  const RealestateButton(
      {Key? key, required this.title, required this.callback})
      : super(key: key);
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 6.h,
        width: 50.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 10.sp, color: Colors.white)),
        ),
      ),
    );
  }
}

class MainButton2 extends StatelessWidget {
  const MainButton2({Key? key, required this.title, required this.callback})
      : super(key: key);
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w), color: Colors.red),
        child: Center(
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 13.sp)),
        ),
      ),
    );
  }
}
