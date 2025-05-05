import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:sizer/sizer.dart';

class PinEntry extends StatefulWidget {
  PinEntry({Key? key}) : super(key: key);

  @override
  _PinEntryState createState() => _PinEntryState();
}

class _PinEntryState extends State<PinEntry> {
  List codeEntry = [];
  bool displayLoader = false;
  String completedDigit = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      width: 100.w,
      color: Color(0xFF222222),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          Image.asset(
            "assets/images/l1.png",
            height: 8.h,
            fit: BoxFit.cover,
          ),
          Text(
            "Enter your passcode",
            style: TextStyle(
                fontSize: 12.sp, fontFamily: "Muli", color: Colors.white),
          ),
          SizedBox(height: displayLoader ? 12.h : 12.h),
          Center(
            child: Container(
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 13.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: codeEntry.length >= 1
                          ? oxygenPrimaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: oxygenPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 13.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: codeEntry.length >= 2
                          ? oxygenPrimaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: oxygenPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 13.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: codeEntry.length >= 3
                          ? oxygenPrimaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: oxygenPrimaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 13.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: codeEntry.length == 4
                          ? oxygenPrimaryColor
                          : Colors.transparent,
                      border: Border.all(
                        color: oxygenPrimaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 2.h),
          displayLoader
              ? Visibility(
                  visible: displayLoader,
                  child: SpinKitCircle(color: Colors.white, size: 5.h),
                )
              : Container(
                  height: 5.h,
                ),
          SizedBox(height: 6.h),
          Container(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: keyboard())
        ],
      ),
    );
  }

  Widget circularContainers() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red[500]!,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Widget keyboard() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("1");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Muli",
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("2");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Muli",
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("3");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Center(
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Muli",
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("4");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "4",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("5");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "5",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("6");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "6",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("7");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "7",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("8");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "8",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("9");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "9",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 15.w,
                child: Center(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.add("0");
                  });
                  if (codeEntry.length == 4) {
                    displayLoaderCircle();
                  }
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Muli",
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    codeEntry.removeLast();
                  });
                },
                child: Container(
                  width: 15.w,
                  child: Center(
                    child: Icon(
                      CupertinoIcons.delete_left,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  displayLoaderCircle() {
    String localPin =
        OxygenApp.sharedPreferences!.getString(OxygenApp.localPin).toString();
    for (var i = 0; i < codeEntry.length; i++) {
      completedDigit += codeEntry[i];
    }

    print(completedDigit);
    print(localPin);
    if (completedDigit == localPin) {
      Route route = MaterialPageRoute(builder: (_) => MainScreen(sIndex: 0));
      Navigator.pushReplacement(context, route);
    } else {
      setState(() {
        codeEntry = [];
        completedDigit = "";
      });
      // ignore: avoid_single_cascade_in_expression_statements
      // AwesomeDialog(
      //   context: context,
      //   animType: AnimType.RIGHSLIDE,
      //   headerAnimationLoop: true,
      //   dialogType: DialogType.ERROR,
      //   body: Center(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //             height:
      //                 SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //             "Wrong pin",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(
      //               fontSize: 10.sp,
      //               fontFamily: "Muli",
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //             height: SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h)
      //       ],
      //     ),
      //   ),
      //   buttonsTextStyle: TextStyle(
      //     fontSize: 10.sp,
      //     fontFamily: "Muli",
      //   ),
      //   desc: 'Your response has been saved',
      //   btnOkColor: Colors.red,
      //   btnOkText: "Try again",
      //   btnOkOnPress: () {},
      // )..show();
    }
  }
}
