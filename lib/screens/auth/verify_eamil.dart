import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/controllers/auth_controllers/signup_controller.dart';
import 'package:oxygen_loans/screens/dashboard/dashboard.dart';
import 'package:oxygen_loans/screens/widgets/pin_code_fields.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(initState: (controller) {
      // ctrl.codeCtrl = TextEditingController();
    }, builder: (controller) {
      return Scaffold(
        // appBar: ClearAppbar(
        //     title: isReset ? "Reset password" : "Create account", widgets: []),
        body: Column(
          children: [
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    "Verify Email",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Please enter the code that was sent to your email to proceed",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF757575)),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 90.w,
                    child: PinCodeEntryFields(
                      codeController: controller.codeCtrl,
                      formKey: controller.codeFormKey,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  MainButton(
                      title: "Verify Phone",
                      callback: () {
                        controller.verifyEmail();
                      }),
                  SizedBox(height: 4.h),
                  InkWell(
                    onTap: () async {
                      if (controller.start == 0) {
                        controller.start = 60;
                        controller.update();
                        controller.resendOpt();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resend code   ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(33, 33, 33, 1),
                                  fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " 0:${controller.start}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: 12.sp,
                                  color: Color.fromRGBO(184, 186, 191, 1),
                                  fontWeight: FontWeight.w400),
                        ),
                        SizedBox(width: 2.w),
                        Visibility(
                          visible: controller.start == 0,
                          child: Text(
                            "Tap to resend ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(33, 33, 33, 1),
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
