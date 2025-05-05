// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/auth_controllers/forgot_password.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final loginController = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GetBuilder<ForgotPasswordController>(
          initState: (controller) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: oxygenPrimaryColor),
                              shape: BoxShape.rectangle,
                              color: Colors.white),
                          child: Icon(Icons.arrow_back,
                              color: Colors.black, size: 30.sp),
                        ),
                      ),
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
                      SizedBox(height: 1.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Please enter your email address to reset your password",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Muli",
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF05242C),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Email address",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      FormField2(
                        ctrl: controller.emailController,
                        isObscure: false,
                        hint: "Email",
                        validator: (value) {},
                        onSaved: (value) {},
                      ),
                      SizedBox(height: 2.h),
                      MainButton(
                        title: "Reset password",
                        callback: () {
                          controller.sendRequest();
                        },
                      )
                    ],
                  )),
            );
          }),
    ));
  }
}
