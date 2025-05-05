import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/auth_controllers/signup_controller.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class PinCodeEntryFields extends StatelessWidget {
  const PinCodeEntryFields(
      {Key? key, required this.codeController, required this.formKey})
      : super(key: key);
  final TextEditingController codeController;
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5.w),
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w300),
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w300),
              length: 5,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                borderWidth: 0.75,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 10.w,
                fieldWidth: 10.w,
                activeFillColor: Colors.transparent,
                activeColor: Color(0xFFE2E2E2),
                selectedColor: Color(0xFFE2E2E2),
                selectedFillColor: Colors.transparent,
                inactiveColor: Color(0xFFE2E2E2),
                inactiveFillColor: Colors.transparent,
                disabledColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: codeController,
              keyboardType: TextInputType.text,
              onCompleted: (v) {
                print("Completed");
                // controller.verifyEmail();
              },
              onChanged: (value) {
                print(value);
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");

                return true;
              },
            )),
      );
    });
  }
}
