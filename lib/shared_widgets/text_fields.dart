import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MainTextField extends StatelessWidget {
  const MainTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.isObscure,
      this.validator,
      this.onSaved,
      required this.width,
      this.textInputFormatter,
      this.keyboardType,
      this.onChanged,
      this.maxLength,
      this.enabled})
      : super(key: key);
  final String title, hint;
  final TextEditingController controller;
  final bool isObscure;
  final bool? enabled;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final double width;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 6.h : 8.5.h,
      width: width,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFE2E2E2)),
      ),
      child: Center(
        child: TextFormField(
          enabled: enabled ?? true,
          controller: controller,
          maxLength: maxLength,
          obscureText: isObscure,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: textInputFormatter,
          onChanged: onChanged,
          onSaved: onSaved,
          cursorColor: Colors.black,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 9.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 1.h),
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: hint,

            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize:
                    SizerUtil.deviceType == DeviceType.mobile ? 11.sp : 9.sp,
                color: Color(0xFFABAFB1)),
            // fillColor: Color.fromRGBO(93, 95, 204, 0.07),
            // filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      required this.isObscure,
      this.validator,
      this.onSaved,
      required this.width,
      this.onChanged,
      required this.callback})
      : super(key: key);
  final String title, hint;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final double width;
  final Function(String)? onChanged;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.deviceType == DeviceType.mobile ? 7.h : 8.5.h,
      width: width,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        color: Get.isDarkMode
            ? Color(0xFF344051)
            : Color(0xFFE4E7EC).withOpacity(0.3),
        border: Border.all(color: Color(0xFFE2E2E2)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              child: TextFormField(
                controller: controller,
                obscureText: isObscure,
                validator: validator,
                onSaved: onSaved,
                onChanged: onChanged,
                cursorColor: Colors.black,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: SizerUtil.deviceType == DeviceType.mobile
                        ? 11.sp
                        : 9.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  // floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: hint,
                  labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: SizerUtil.deviceType == DeviceType.mobile
                          ? 11.sp
                          : 9.sp,
                      color: Color(0xFFABAFB1)),
                  // fillColor: Color.fromRGBO(93, 95, 204, 0.07),
                  // filled: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            InkWell(
              onTap: callback,
              child: Icon(CupertinoIcons.eye),
            )
          ],
        ),
      ),
    );
  }
}

class BankNameField extends StatelessWidget {
  const BankNameField({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 100.w,
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        color: Colors.transparent,
        border: Border.all(color: Color(0xFFE2E2E2)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: title == "Bank Name"
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 12.sp, color: Color(0xFFABAFB1))
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black, fontSize: 12.sp),
            ),
            Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: Icon(
                CupertinoIcons.chevron_down,
                size: 12.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
