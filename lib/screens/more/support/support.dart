import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/screens/more/support/chat/chat_home.dart';
import 'package:oxygen_loans/screens/more/support/faq.dart';
import 'package:oxygen_loans/screens/more/support/terms.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Help & Support"),
      body: getBody(),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: oxygenPrimaryColor,
      //   onPressed: () {
      //     // Route route = MaterialPageRoute(builder: (_) => ChatHome());
      //     // Navigator.push(context, route);
      //   },
      //   label: Text(
      //     "Live chat",
      //     style: TextStyle(
      //       fontSize: 11.sp,
      //       fontFamily: "Muli",
      //       fontWeight: FontWeight.w400,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }

  Widget getBody() {
    return Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Support",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            supportBox("assets/icons/pBlue.svg", "09167006666, 08097200009"),
            supportBox("assets/icons/pPink.svg", "support@O2intlfin.com"),
            SizedBox(height: 3.h),
            Text(
              "Help",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            InkWell(
              onTap: () {
                Route route = MaterialPageRoute(builder: (_) => Faq());
                Navigator.push(context, route);
              },
              child: Text(
                "Frequently asked questions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Divider(color: Colors.grey),
            SizedBox(height: 2.h),
            InkWell(
              onTap: () async {
                await launchUrl(
                    Uri.parse("https://o2intlfin.com/privacy-policy"));
              },
              child: Text(
                "Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Divider(color: Colors.grey)
          ],
        ));
  }

  Widget supportBox(String url, String value) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                url,
                width: 12.w,
                height: 12.w,
              ),
              SizedBox(width: 5.w),
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Divider(color: Colors.grey)
        ],
      ),
    );
  }

  Widget supportBox2() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.redAccent),
                  child: Icon(
                    CupertinoIcons.chat_bubble_2,
                  )),
              SizedBox(width: 5.w),
              Text(
                "Chat with us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Divider(color: Colors.grey)
        ],
      ),
    );
  }
}
