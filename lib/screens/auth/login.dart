import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/auth_controllers/login_controller.dart';
import 'package:oxygen_loans/screens/auth/create_pin.dart';
import 'package:oxygen_loans/screens/auth/forgot_password.dart';
import 'package:oxygen_loans/screens/auth/register.dart';
import 'package:oxygen_loans/screens/auth/verify_eamil.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class Login extends GetView<LoginController> {
  Login({Key? key}) : super(key: key);
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(5.w),
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
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Welcome back,",
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
                          "Sign in to your account to get access to all our services",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Muli",
                            color: Color(0xFF05242C),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Form(
                        key: controller.loginFormKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
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
                              validator: (value) {
                                return "";
                              },
                              onSaved: (value) {
                                controller.email = value!;
                              },
                            ),
                            SizedBox(height: 2.h),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "Muli",
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            PasswordFormField(
                              callback: () {
                                controller.isObscure = !controller.isObscure;
                                controller.update();
                              },
                              ctrl: controller.passwordController,
                              isObscure: controller.isObscure,
                              hint: "Password",
                              validator: (value) {
                                return "";
                              },
                              onSaved: (value) {
                                controller.password = value!;
                              },
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Text(""),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Route route = MaterialPageRoute(
                                        builder: (c) => ForgotPassword());
                                    Navigator.push(context, route);
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: "Muli",
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            MainButton(
                                title: "Login",
                                callback: () {
                                  controller.login();
                                })
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            "Don't Have an account?",
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontFamily: "Muli",
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Route route =
                                  MaterialPageRoute(builder: (c) => Register());
                              Navigator.push(context, route);
                            },
                            child: Text(
                              "Create an account",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: "Muli",
                                color: oxygenPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
