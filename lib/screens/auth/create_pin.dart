import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/auth_controllers/create_pin_controller.dart';
import 'package:oxygen_loans/screens/widgets/pin_code_fields.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class CreatePin extends GetView<CreatePinController> {
  CreatePin({Key? key}) : super(key: key);
  TextEditingController ctrl = TextEditingController();
  final createPinformKey = GlobalKey<FormState>();
  final creatPinCtrl = Get.put(CreatePinController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(5.w, 5.w, 5.w, 0.w),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "assets/images/l1.png",
                    height: 10.h,
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Create unique pin",
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
                "Create a unique 4-digit pin to access your account faster.",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Muli",
                  color: Color(0xFF05242C),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            PinCodeEntryFields(codeController: ctrl, formKey: createPinformKey),
            SizedBox(height: 8.h),
            MainButton(
                title: "Create pin",
                callback: () {
                  controller.getDigits(ctrl.text);
                })
          ],
        ),
      ),
    );
  }
}
