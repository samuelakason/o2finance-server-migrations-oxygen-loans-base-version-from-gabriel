import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen_loans/providers/theme.dart';
import 'package:oxygen_loans/screens/notifications/notice.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DashBell extends StatefulWidget {
  const DashBell({Key? key}) : super(key: key);

  @override
  _DashBellState createState() => _DashBellState();
}

class _DashBellState extends State<DashBell> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Container(
        child: themeProvider.appTheme == true
            ? _shoppingCartBadge()
            : IconButton(
                icon: SvgPicture.asset("assets/icons/fi_bell.svg"),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (_) => Notice());
                  Navigator.push(context, route);
                },
              ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return SizerUtil.deviceType == DeviceType.mobile
        ? IconButton(
            icon: Icon(
              CupertinoIcons.bell,
              color: Colors.black,
              size: 20.sp,
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
//flutter create -a kotlin .
