import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PinCodeEntryFields extends StatelessWidget {
  const PinCodeEntryFields(
      {Key? key, required this.codeController, required this.formKey})
      : super(key: key);
  final TextEditingController codeController;
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
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
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            length: 4,
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              borderWidth: 0.75,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 18.w,
              fieldWidth: 18.w,
              activeFillColor: Colors.transparent,
              activeColor: Colors.grey,
              selectedColor: Colors.grey,
              selectedFillColor: Colors.transparent,
              inactiveColor: Colors.grey,
              inactiveFillColor: Colors.transparent,
              disabledColor: Colors.white,
            ),
            cursorColor: Colors.grey,
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            controller: codeController,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              print("Completed");
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
  }
}
