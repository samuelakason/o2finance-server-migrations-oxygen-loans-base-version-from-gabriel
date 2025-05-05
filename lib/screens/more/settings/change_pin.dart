import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class ChangePin extends StatefulWidget {
  ChangePin({Key? key}) : super(key: key);

  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  List<String> codeEntered = [];
  String completedDigit = "";
  bool isVerifying = false;
  bool isVerifiable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Change pin"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
      child: Column(
        children: [Expanded(child: verify()), textEntry()],
      ),
    );
  }

  Widget verify() {
    return Container(
      padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 0.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo-blue.png",
                  height: 10.h,
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Unique pin",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Muli",
                fontWeight: FontWeight.w800,
                color: Color(0xFF05242C),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Create a new unique pin below",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF05242C),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Container(
                width: 20.w,
                height: 8.h,
                padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(1.w),
                    ),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    codeEntered.length > 0 ? codeEntered[0] : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                width: 20.w,
                height: 8.h,
                padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(1.w),
                    ),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    codeEntered.length > 1 ? codeEntered[1] : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                width: 20.w,
                height: 8.h,
                padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(1.w),
                    ),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    codeEntered.length > 2 ? codeEntered[2] : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                width: 20.w,
                height: 8.h,
                padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
                decoration: BoxDecoration(
                    color: Color(0xFFFCFCFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(1.w),
                    ),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text(
                    codeEntered.length > 3 ? codeEntered[3] : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: "Muli",
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
          MainButton(
              title: "Change pin",
              callback: () {
                getDigits();
              })
        ],
      ),
    );
  }

  Widget textPad(String mainNumber, String abc) {
    return Container(
      width: 29.w,
      padding: EdgeInsets.fromLTRB(4.w, 1.w, 4.w, 1.w),
      decoration: BoxDecoration(
        color: Color(0xFFFCFCFE),
        borderRadius: BorderRadius.all(
          Radius.circular(1.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            mainNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              fontFamily: "Muli",
              color: Colors.black,
            ),
          ),
          Text(
            abc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 7.sp,
              fontFamily: "Muli",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget textEntry() {
    return Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        height: 35.h,
        width: 100.w,
        color: Color(0xFFD1D5DB),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("1");
                        }
                      });
                    },
                    child: textPad("1", " ")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("2");
                        }
                      });
                    },
                    child: textPad("2", "A B C")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("3");
                        }
                      });
                    },
                    child: textPad("3", "D E F")),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("4");
                        }
                      });
                    },
                    child: textPad("4", "G H I")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("5");
                        }
                      });
                    },
                    child: textPad("5", "J K L")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("6");
                        }
                      });
                    },
                    child: textPad("6", "M N O")),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("7");
                        }
                      });
                    },
                    child: textPad("7", "P Q R S")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("8");
                        }
                      });
                    },
                    child: textPad("8", "T U V")),
                InkWell(
                    onTap: () {
                      setState(() {
                        if (codeEntered.length <= 4) {
                          codeEntered.add("9");
                        }
                      });
                    },
                    child: textPad("9", "W X Y Z")),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 29.w,
                ),
                Container(
                  width: 29.w,
                  padding: EdgeInsets.fromLTRB(4.w, 1.w, 4.w, 1.w),
                  decoration: BoxDecoration(
                    color: Color(0xFFFCFCFE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(1.w),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (codeEntered.length <= 4) {
                              codeEntered.add("0");
                            }
                          });
                        },
                        child: Text(
                          "0",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            fontFamily: "Muli",
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      codeEntered.removeLast();
                    });
                  },
                  child: Container(
                    width: 29.w,
                    child: Icon(
                      CupertinoIcons.delete_left,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  getDigits() async {
    setState(() {
      isVerifying = true;
      isVerifiable = false;
    });

    if (isVerifiable == false) {
      for (var i = 0; i < 4; i++) {
        completedDigit += codeEntered[i];
      }
    }

    print(completedDigit);

    await OxygenApp.sharedPreferences!
        .setString(OxygenApp.localPin, completedDigit)
        .then((value) {
      // ignore: avoid_single_cascade_in_expression_statements
      // AwesomeDialog(
      //   context: context,
      //   animType: AnimType.RIGHSLIDE,
      //   headerAnimationLoop: true,
      //   dialogType: DialogType.SUCCES,
      //   body: Center(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //             height:
      //                 SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //             "Pin created succsfully",
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
      //   btnOkColor: Colors.green,
      //   btnOkText: "Ok",
      //   btnOkOnPress: () {
      //     Navigator.pop(context);
      //   },
      // )..show();
    });

    print(completedDigit);
  }
}
