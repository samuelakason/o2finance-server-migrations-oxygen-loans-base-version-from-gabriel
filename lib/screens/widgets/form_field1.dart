import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:sizer/sizer.dart';

class FormField1 extends StatelessWidget {
  const FormField1(
      {Key? key,
      required this.ctrl,
      required this.isObscure,
      required this.hint,
      required this.validator,
      required this.onSaved})
      : super(key: key);
  final TextEditingController ctrl;
  final bool isObscure;
  final String hint;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: validator,
      onSaved: onSaved,
      obscureText: isObscure,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.h),
        labelText: hint,
        labelStyle: TextStyle(
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 10.sp : 7.sp,
            fontFamily: "Muli",
            color: Colors.grey),
        fillColor: Color(0xFF0f1245),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.w),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField(
      {Key? key,
      required this.ctrl,
      required this.isObscure,
      required this.hint,
      required this.validator,
      required this.onSaved,
      required this.callback})
      : super(key: key);
  final TextEditingController ctrl;
  final bool isObscure;
  final String hint;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: validator,
      onSaved: onSaved,
      obscureText: isObscure,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(4.w),
          child: InkWell(
              onTap: callback,
              child: SvgPicture.asset(
                "assets/icons/eye.svg",
                height: 0.w,
                width: 0.w,
              )),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.h),
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.grey),
        labelStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        fillColor: Color(0xFF0f1245),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.w),
          borderSide: const BorderSide(color: oxygenPrimaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}

class FormField2 extends StatelessWidget {
  const FormField2(
      {Key? key,
      required this.ctrl,
      required this.isObscure,
      required this.hint,
      required this.validator,
      required this.onSaved})
      : super(key: key);
  final TextEditingController ctrl;
  final bool isObscure;
  final String hint;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: validator,
      onSaved: onSaved,
      obscureText: isObscure,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 1.h),
        // labelText: hint,
        hintText: hint,
        hintStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        labelStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        fillColor: Color(0xFF0f1245),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.w),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}

class FormField3 extends StatelessWidget {
  const FormField3(
      {Key? key,
      required this.ctrl,
      required this.isObscure,
      required this.hint,
      required this.validator,
      required this.onSaved})
      : super(key: key);
  final TextEditingController ctrl;
  final bool isObscure;
  final String hint;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: validator,
      onSaved: onSaved,
      obscureText: isObscure,
      maxLines: 9,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.black,
          fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
        // labelText: hint,
        hintText: hint,
        hintStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        labelStyle:
            TextStyle(fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
        fillColor: Color(0xFF0f1245),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.w),
          borderSide: const BorderSide(color: oxygenPrimaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: oxygenPrimaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: oxygenPrimaryColor, width: 1.0),
          borderRadius: BorderRadius.circular(5.w),
        ),
      ),
    );
  }
}
