// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';

import 'package:oxygen_loans/screens/auth/create_password.dart';
import 'package:oxygen_loans/screens/auth/register2.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../controllers/auth_controllers/signup_controller.dart';

class Register extends GetView<SignUpController> {
  Register({Key? key}) : super(key: key);
  final signUpcontroller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    "Register on 02 Loans",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF05242C),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Join thousands of users using 02 loans to secure loans for emergency need and bills.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF05242C),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Form(
                  key: controller.signupFormKey1,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "First name",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      FormField1(
                        ctrl: controller.firstNameTextEditingController,
                        isObscure: false,
                        hint: "First name",
                        validator: (value) {
                          return controller.validateText(value!);
                        },
                        onSaved: (value) {
                          controller.firstname = value!;
                        },
                      ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "Last name",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      FormField1(
                        ctrl: controller.lastnameTextEditingController,
                        isObscure: false,
                        hint: "Last name",
                        validator: (value) {
                          return controller.validateText(value!);
                        },
                        onSaved: (value) {
                          controller.lastname = value!;
                        },
                      ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "Username",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 2.h),
                      // FormField1(
                      //   ctrl: controller.userNameTextEditingController,
                      //   isObscure: false,
                      //   hint: "Username",
                      //   validator: (value) {
                      //     return controller.validateText(value!);
                      //   },
                      //   onSaved: (value) {
                      //     controller.username = value!;
                      //   },
                      // ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "Referral",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      FormField1(
                        ctrl: controller.refTextEditingController,
                        isObscure: false,
                        hint: "Referral",
                        validator: (value) {},
                        onSaved: (value) {
                          controller.referral = value!;
                        },
                      ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "Email",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      FormField1(
                        ctrl: controller.emailTextEditingController,
                        isObscure: false,
                        hint: "Email",
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                        onSaved: (value) {
                          controller.email = value!;
                        },
                      ),

                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text(
                      //     "Phonenumber",
                      //     style: TextStyle(
                      //       fontSize: 12.sp,
                      //       fontFamily: "Muli",
                      //       color: Colors.grey,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 2.h),
                      FormField1(
                        ctrl: controller.phoneTextEditingController,
                        isObscure: false,
                        hint: "Phonenumber",
                        validator: (value) {
                          return controller.validateText(value!);
                        },
                        onSaved: (value) {
                          controller.phone = value!;
                        },
                      ),
                      SizedBox(height: 2.h),

                      FormField1(
                        ctrl: controller.bvnController,
                        isObscure: false,
                        hint: "Bank verification number",
                        validator: (value) {
                          return controller.validateText(value!);
                        },
                        onSaved: (value) {
                          controller.bvnNo = value!;
                        },
                      ),
                      SizedBox(height: 2.h),
                      Column(
                        children: [
                          // Align(
                          //   alignment: Alignment.bottomLeft,
                          //   child: Text(
                          //     "Date of birth",
                          //     style: TextStyle(
                          //       fontSize: 11.sp,
                          //       fontFamily: "Muli",
                          //       color: Colors.grey,
                          //     ),
                          //   ),
                          // ),

                          InkWell(
                            onTap: () {
                              controller.selectDate(context);
                            },
                            child: Container(
                              height: 6.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(5.w)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 4.w),
                                  Obx(() => Text(
                                        controller.displayDate.value,
                                        style: TextStyle(
                                            fontSize: SizerUtil.deviceType ==
                                                    DeviceType.mobile
                                                ? 10.sp
                                                : 7.sp,
                                            fontFamily: "Muli",
                                            color:
                                                controller.displayDate.value ==
                                                        "Select date of birth"
                                                    ? Colors.grey
                                                    : Colors.black),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h)
                        ],
                      ),
                      SizedBox(height: 1.h),

                      MainButton(
                          title: "Next",
                          callback: () {
                            controller.navigateToNext(context);
                          }),
                      // InkWell(
                      //   onTap: () {
                      //     controller.navigateToNext(context);
                      //   },
                      //   child: Container(
                      //     height: 8.h,
                      //     padding: EdgeInsets.all(4.w),
                      //     decoration: BoxDecoration(
                      //         color: oxygenPrimaryColor,
                      //         borderRadius: BorderRadius.circular(5.w)),
                      //     child: Center(
                      //       child: Text(
                      //         "Next",
                      //         style: TextStyle(
                      //           fontSize: 11.sp,
                      //           fontFamily: "Muli",
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastnameTextEditingController =
      TextEditingController();
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _refTextEditingController =
      TextEditingController(text: "");
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _dobTextEditingController =
      TextEditingController();
  final TextEditingController _bvnTextEditingController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();
  String displayDate = "Select date";
  String secretKey = "sk_test_273c814d7c96c32e4310fbd722f00e7d3fa620f7";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    "Register on 02 Loans",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "Muli",
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF05242C),
                    ),
                  ),
                ),
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Join thousands of users using 02 loans to secure loans for emergency need and bills.",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF05242C),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                authFormField("First Name", _firstNameTextEditingController,
                    "First Name", false),
                authFormField("Last Name", _lastnameTextEditingController,
                    "Last Name", false),
                authFormField("Username", _userNameTextEditingController,
                    "Username", false),
                authFormField("Referral code (Optional)",
                    _refTextEditingController, "Referral code", false),
                authFormField(
                    "Email", _emailTextEditingController, "Email", false),
                authFormField("Phone Number", _phoneTextEditingController,
                    "Phone Number", false),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Date of birth",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.fromLTRB(5.w, 2.0.h, 5.w, 2.0.h),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: oxygenPrimaryColor, width: 1),
                            borderRadius: BorderRadius.circular(5.w)),
                        child: Text(
                          displayDate,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Muli",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h)
                  ],
                ),
                SizedBox(height: 1.h),
                InkWell(
                  onTap: () {
                    navigateToNext();
                  },
                  child: Container(
                    height: 8.h,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        color: oxygenPrimaryColor,
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

*/
