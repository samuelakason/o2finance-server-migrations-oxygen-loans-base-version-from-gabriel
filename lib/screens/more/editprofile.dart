// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/auth/login.dart';
import 'package:oxygen_loans/screens/more/profile/editprofile_2.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Edit profile"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      padding: EdgeInsets.all(4.w),
      child: Column(
        children: [editUserInfo(), signOut()],
      ),
    );
  }

  Widget editUserInfo() {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(builder: (_) => EditProfile2());
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: OxygenApp.sharedPreferences!
                        .getString(OxygenApp.userAvatarUrl)
                        .toString(),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 8.h,
                      height: 8.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) =>
                        SpinKitDoubleBounce(color: Colors.white, size: 8.h),
                    errorWidget: (context, url, error) => Container(
                      width: 8.h,
                      height: 8.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/black.jpeg"),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFBDBDBD),
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Edit profile",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                CupertinoIcons.chevron_right,
                color: Colors.black,
                size: 14.sp,
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget signOut() {
    return InkWell(
      onTap: () {
        showModal();
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8.h,
                    height: 8.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFCB1111),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFBDBDBD),
                            blurRadius: 5.0,
                            offset: Offset(0.0, 0.75)),
                      ],
                    ),
                    child: Icon(
                      Icons.logout,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Sign out",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 1.h),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }

  showModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool accepted = false;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return GestureDetector(
              onDoubleTap: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.001),
                child: GestureDetector(
                  onTap: () {},
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.47,
                    minChildSize: 0.2,
                    maxChildSize: 0.47,
                    builder: (_, controller) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.w),
                            topRight: Radius.circular(5.w),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 4.h),
                            Icon(
                              CupertinoIcons.drop_triangle,
                              color: Colors.red,
                              size: 12.h,
                            ),
                            Text(
                              "Are you sure you want to sign out?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Muli",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 4.h),
                            MainButton(
                                title: "Yes",
                                callback: () {
                                  OxygenApp.sharedPreferences!
                                      .setBool(OxygenApp.isLoggedIn, false);
                                  OxygenApp.sharedPreferences!
                                      .setString(OxygenApp.userToken, "");
                                  Get.offAll(() => Login(),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      transition: Transition.rightToLeft);
                                }),
                            SizedBox(height: 2.h),
                            MainButton(
                                title: "Cancel",
                                callback: () {
                                  Navigator.pop(context);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ));
          ;
        });
      },
    );
  }
}
