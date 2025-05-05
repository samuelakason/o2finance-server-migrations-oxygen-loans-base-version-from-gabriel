import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Conditions extends StatefulWidget {
  Conditions({Key? key}) : super(key: key);

  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Terms and Conditions"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        width: 100.w,
        constraints: BoxConstraints(
          minHeight: 100.h,
        ),
        padding: EdgeInsets.fromLTRB(4.w, 1.w, 4.w, 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "We are committed to protecting your Privacy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F)),
            ),
            SizedBox(height: 1.h),
            Text(
              "This User Agreement (“Agreement”) is a contract between you and Critical Ideas, Inc. (“Company”) and applies to your use of Pear® products and services and any other Pear® features, technologies, and/or functionalities offered by Company on our website, in the Pear app or through any other means (the “Pear Services”). The Pear Services are provided to you subject to this Agreement as well as our Privacy Policy (“Privacy Policy”) which is incorporated in this Agreement by this reference.",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF999999)),
            ),
            SizedBox(height: 2.h),
            Text(
              "Third Party  Agreement",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F)),
            ),
            SizedBox(height: 1.h),
            Text(
              "You acknowledge and agree that this Agreement is between you and Company, not with any third party (including, but not limited to, Apple®, Google®, or any mobile carrier), and that Company is solely responsible for the Pear Services. Your use of the Pear services.",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF999999)),
            ),
            SizedBox(height: 2.h),
            Text(
              "We are committed to protecting your Privacy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF4F4F4F)),
            ),
            SizedBox(height: 1.h),
            Text(
              "This User Agreement (“Agreement”) is a contract between you and Critical Ideas, Inc. (“Company”) and applies to your use of Pear® products and services and any other Pear® features, technologies, and/or functionalities offered by Company on our website, in the Pear app or through any other means (the “Pear Services”). The Pear Services are provided to you subject to this Agreement as well as our Privacy Policy (“Privacy Policy”) which is incorporated in this Agreement by this reference.",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF999999)),
            ),
          ],
        ),
      ),
    );
  }
}
