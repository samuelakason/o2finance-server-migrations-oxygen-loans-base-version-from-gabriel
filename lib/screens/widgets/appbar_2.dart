import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/providers/theme.dart';
import 'package:oxygen_loans/screens/notifications/notice.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyAppBar2 extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar2(
    this.title, {
    Key? key,
    this.notificationScreen,
  }) : super(key: key);
  final String title;
  final bool? notificationScreen;

  @override
  _MyAppBar2State createState() => _MyAppBar2State();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(SizerUtil.deviceType == DeviceType.mobile ? 9.h : 6.8.h);
}

class _MyAppBar2State extends State<MyAppBar2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            widget.notificationScreen == null
                ? SizedBox(
                    child: themeProvider.appTheme == true
                        ? _shoppingCartBadge()
                        : IconButton(
                            icon: Icon(
                              CupertinoIcons.bell,
                              size: 17.sp,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Route route =
                                  MaterialPageRoute(builder: (_) => Notice());
                              Navigator.push(context, route);
                            },
                          ),
                  )
                : SizedBox()
          ],
          bottom: PreferredSize(
              child: Container(
                color: Color(0xFF0F2F2F2),
                height: 4.0,
              ),
              preferredSize: Size.fromHeight(4.0)),
          leading: Container(
            height: 3,
            width: 3,
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.fromLTRB(20, 2, 0, 2),
            decoration: BoxDecoration(
                color: Color.fromRGBO(26, 182, 220, 0.1),
                shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                icon: Icon(CupertinoIcons.chevron_back,
                    size: 13.sp, color: Colors.green),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Muli",
              fontWeight: FontWeight.w800,
              color: Color(0xFF05242C),
            ),
          ),
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
                  size: 17.sp,
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (_) => Notice());
                  Navigator.push(context, route);
                }));
  }

  getDetails() async {
    // String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);

    // var userDetails =
    //     await OxygenApp.firestore.collection('users').doc(userID).get();

    // ThemeProvider themeProvider =
    //     Provider.of<ThemeProvider>(context, listen: false);
    // themeProvider.changeThemeColor(userDetails["unViewed"]);
  }
}
