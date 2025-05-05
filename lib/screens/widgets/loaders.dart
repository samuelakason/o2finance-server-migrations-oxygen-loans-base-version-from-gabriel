import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:sizer/sizer.dart';

class LoadersIcons {
  preloader(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        // animationType: DialogTransitionType.slideFromBottom,
        // curve: Curves.fastOutSlowIn,
        // duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Center(
                          child: SpinKitDoubleBounce(
                              color: oxygenPrimaryColor, size: 5.h),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  successMessage(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 38.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: 27.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                        child: Text(message,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Positioned(
                        top: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.check_mark_circled,
                            color: oxygenPrimaryColor,
                            size: 70.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 24.h,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: oxygenPrimaryColor,
                                borderRadius: BorderRadius.circular(3.w)),
                            child: Center(
                              child: Text('Verify and Login',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Muli",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  genSuccessMessage(
      BuildContext context, String message, double height1, double height2) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: height1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: height2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(3.w, 15.w, 3.w, 3.w),
                        child: Text(message,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Positioned(
                        top: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.check_mark_circled,
                            color: oxygenPrimaryColor,
                            size: 70.sp,
                          ),
                        ),
                      ),
                      /*
                      Positioned(
                        top: height3,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: cryptoPrimaryColor,
                                borderRadius: BorderRadius.circular(3.w)),
                            child: Center(
                              child: Text('Okay',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Muli",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                      */
                    ],
                  ),
                ));
          });
        });
  }

  SuccessMessageBtn(BuildContext context, String message, double height1,
      height2, height3, VoidCallback callback) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: height1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: height2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(3.w, 15.w, 3.w, 3.w),
                        child: Text(message,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Positioned(
                        top: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.check_mark_circled,
                            color: oxygenPrimaryColor,
                            size: 70.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height3,
                        child: InkWell(
                          onTap: callback,
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: oxygenPrimaryColor,
                                borderRadius: BorderRadius.circular(3.w)),
                            child: Center(
                              child: Text('Okay',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Muli",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  queryMessage(BuildContext context, String message, VoidCallback callback) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 33.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: 22.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                        child: Text(message,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Positioned(
                        top: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.question_circle,
                            color: oxygenPrimaryColor,
                            size: 70.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        child: InkWell(
                          onTap: callback,
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: oxygenPrimaryColor,
                                borderRadius: BorderRadius.circular(3.w)),
                            child: Center(
                              child: Text('Proceed',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Muli",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }

  errorMessage(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        // animationType: DialogTransitionType.slideFromBottom,
        // curve: Curves.fastOutSlowIn,
        // duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 38.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(2.w, 7.h, 2.w, 2.w),
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Text(message,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Muli",
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Positioned(
                          top: 1.h,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                CupertinoIcons.xmark_circle,
                                color: Colors.red,
                                size: 70.sp,
                              ),
                            ),
                          ))
                    ],
                  ),
                ));
          });
        });
  }

  logOutDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 35.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        width: 65.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        padding: EdgeInsets.fromLTRB(2.w, 10.h, 2.w, 2.w),
                        child: Text(message,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Positioned(
                        top: 1.h,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.question_circle,
                            color: oxygenPrimaryColor,
                            size: 70.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 23.h,
                        child: InkWell(
                          onTap: () async {},
                          child: Container(
                            width: 40.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: oxygenPrimaryColor,
                                borderRadius: BorderRadius.circular(3.w)),
                            child: Center(
                              child: Text('Log out',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: "Muli",
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }
}
