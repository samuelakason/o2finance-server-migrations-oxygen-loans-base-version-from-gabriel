import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/referral.dart';
import 'package:oxygen_loans/screens/referal/referred_friends.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Refer extends StatelessWidget {
  Refer({Key? key}) : super(key: key);
  final ctrl = Get.put(ReferralController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferralController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
              appBar: MyAppBar2("Invite friends"),
              body: Container(
                padding: EdgeInsets.all(4.w),
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    Image.asset(
                      "assets/images/splash1.png",
                      height: 30.h,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Refer a Friend today",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Muli",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Get 500 everytime someone registers with your referal link",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "Muli",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    ReferBox(code: controller.refCode),
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (_) => ReferredFriends());
                        Navigator.push(context, route);
                      },
                      child: Container(
                        height: 8.h,
                        margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: oxygenPrimaryColor),
                            borderRadius: BorderRadius.circular(4.w),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            "View referred friends",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: oxygenPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}

class ReferBox extends StatelessWidget {
  ReferBox({Key? key, required this.code}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: code)).then((value) {
          Fluttertoast.showToast(
              msg: "Referal code copied",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: oxygenPrimaryColor,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: oxygenPrimaryColor,
            borderRadius: BorderRadius.circular(4.w)),
        padding: EdgeInsets.all(4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/svg/copy2.svg",
              color: Colors.black,
            ),
            Text(
              code,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: "Muli",
                color: Colors.white,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/copy.svg",
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
