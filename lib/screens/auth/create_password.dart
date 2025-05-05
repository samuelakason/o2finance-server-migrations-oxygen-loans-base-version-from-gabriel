// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:oxygen_loans/config/color_config.dart';

import 'package:oxygen_loans/controllers/auth_controllers/signup_controller.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';

import 'package:sizer/sizer.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GetBuilder<SignUpController>(
            initState: (controller) {},
            builder: (controller) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: oxygenPrimaryColor),
                                  borderRadius: BorderRadius.circular(3.w),
                                  color: Colors.white),
                              child: Icon(Icons.arrow_back,
                                  color: oxygenPrimaryColor, size: 30.sp),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/l1.png",
                                  width: 20.w,
                                  height: 20.w,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Create a password",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Muli",
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF05242C),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Create a unique password for your account and get started.",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Muli",
                                color: Color(0xFF05242C),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Form(
                            key: controller.createPasswordFormKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                // Align(
                                //   alignment: Alignment.bottomLeft,
                                //   child: Text(
                                //     "Password",
                                //     style: TextStyle(
                                //       fontSize: 12.sp,
                                //       fontFamily: "Muli",
                                //       color: Colors.grey,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 2.h),
                                PasswordFormField(
                                  callback: () {
                                    controller.isObscure =
                                        !controller.isObscure;
                                    controller.update();
                                  },
                                  ctrl: controller.passwordController,
                                  isObscure: controller.isObscure,
                                  hint: "Password",
                                  validator: (value) {
                                    return "true";
                                  },
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                ),
                                // Align(
                                //   alignment: Alignment.bottomLeft,
                                //   child: Text(
                                //     "Confirm password",
                                //     style: TextStyle(
                                //       fontSize: 12.sp,
                                //       fontFamily: "Muli",
                                //       color: Colors.grey,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 2.h),
                                PasswordFormField(
                                  callback: () {
                                    controller.isObscure =
                                        !controller.isObscure;
                                    controller.update();
                                  },
                                  ctrl: controller.cPasswordController,
                                  isObscure: controller.isObscure,
                                  hint: "Confirm password number",
                                  validator: (value) {
                                    return "";
                                  },
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "By signing up on our platform, you agree to the Terms and Conditions of this service.",
                                    style: TextStyle(
                                      fontSize: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 10.sp
                                          : 7.sp,
                                      fontFamily: "Muli",
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                MainButton(
                                    title: "Creat an account",
                                    callback: () {
                                      if (controller.passwordController.text ==
                                          controller.cPasswordController.text) {
                                        controller.registerUser();
                                      } else {
                                        Get.snackbar(
                                            'Error!', "Passwords do not match",
                                            isDismissible: true,
                                            shouldIconPulse: true,
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.65),
                                            colorText: Color(0xFFFFFFFF));
                                      }
                                    })
                                // InkWell(
                                //   onTap: () {

                                //   },
                                //   child: Container(
                                //     height: 8.h,
                                //     padding: EdgeInsets.all(4.w),
                                //     decoration: BoxDecoration(
                                //         color: oxygenPrimaryColor,
                                //         borderRadius:
                                //             BorderRadius.circular(5.w)),
                                //     child: Center(
                                //       child: Text(
                                //         "Creat an account",
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
            }));
  }
}
