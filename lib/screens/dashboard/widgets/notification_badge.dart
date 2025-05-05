import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/notifications/notice.dart';
import 'package:sizer/sizer.dart';

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizerUtil.deviceType == DeviceType.mobile
        ? IconButton(
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
              size: 15.sp,
            ),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (_) => Notice());
              Navigator.push(context, route);
            })
        : Container(
            margin: EdgeInsets.all(1.w),
            child: IconButton(
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.black,
                  size: 12.sp,
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (_) => Notice());
                  Navigator.push(context, route);
                }));
  }
}
