// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/auth_controllers/signup_controller2.dart';
// import 'package:oxygen_loans/screens/auth/create_password.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:http/http.dart' as http;
// import 'package:oxygen_loans/screens/widgets/form_field1.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:sizer/sizer.dart';

// class Register2 extends GetView<SignupController2> {
//   Register2({Key? key}) : super(key: key);
//   final signUpcontroller2 = Get.put(SignupController2());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//             padding: EdgeInsets.all(4.w),
//             child: Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     padding: EdgeInsets.all(6.w),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: oxygenPrimaryColor),
//                         borderRadius: BorderRadius.circular(3.w),
//                         color: Colors.white),
//                     child: Icon(Icons.arrow_back,
//                         color: oxygenPrimaryColor, size: 30.sp),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Image.asset(
//                     "assets/images/l1.png",
//                     width: 20.w,
//                     height: 20.w,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     "Enter bank details",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: "Muli",
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 4.h),
//                 Form(
//                   key: controller.register2FormKey,
//                   autovalidateMode: AutovalidateMode.disabled,
//                   child: Column(
//                     children: [
//                       // Align(
//                       //   alignment: Alignment.bottomLeft,
//                       //   child: Text(
//                       //     "Account number",
//                       //     style: TextStyle(
//                       //       fontSize: 12.sp,
//                       //       fontFamily: "Muli",
//                       //       color: Colors.grey,
//                       //     ),
//                       //   ),
//                       // ),
//                       SizedBox(height: 2.h),
//                       FormField1(
//                         ctrl: controller.accountNoController,
//                         isObscure: false,
//                         hint: "Account number",
//                         validator: (value) {
//                           return controller.validateText(value!);
//                         },
//                         onSaved: (value) {
//                           controller.accNo = value!;
//                         },
//                       ),

//                       // Align(
//                       //   alignment: Alignment.bottomLeft,
//                       //   child: Text(
//                       //     "Bank verification number",
//                       //     style: TextStyle(
//                       //       fontSize: 12.sp,
//                       //       fontFamily: "Muli",
//                       //       color: Colors.grey,
//                       //     ),
//                       //   ),
//                       // ),
//                       SizedBox(height: 2.h),
//                       FormField1(
//                         ctrl: controller.bvnController,
//                         isObscure: false,
//                         hint: "Bank verification number",
//                         validator: (value) {
//                           return controller.validateText(value!);
//                         },
//                         onSaved: (value) {
//                           controller.bvnNo = value!;
//                         },
//                       ),

//                       // Align(
//                       //   alignment: Alignment.bottomLeft,
//                       //   child: Text(
//                       //     "Bank",
//                       //     style: TextStyle(
//                       //       fontSize: 11.sp,
//                       //       fontFamily: "Muli",
//                       //       color: Colors.black,
//                       //     ),
//                       //   ),
//                       // ),
//                       SizedBox(height: 2.h),
//                       DecoratedBox(
//                         decoration: ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1.0,
//                                 style: BorderStyle.solid,
//                                 color: oxygenPrimaryColor),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.w)),
//                           ),
//                         ),
//                         child: Container(
//                           width: 100.w,
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 2.h, vertical: 2.h),
//                           child: DropdownButtonHideUnderline(
//                             child: Obx(() => DropdownButton<String>(
//                                   value: controller.currentBank.value,
//                                   isDense: true,
//                                   onChanged: (newValue) {
//                                     controller.currentBank.value = newValue!;

//                                     controller.bankIndex =
//                                         controller.banksConfirmed.indexWhere(
//                                             (element) => element == newValue);
//                                     controller.currentBankCode = controller
//                                         .banksCodes[controller.bankIndex];
//                                     print(controller.currentBankCode);
//                                   },
//                                   items: controller.banksConfirmed
//                                       .map((String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(
//                                         value,
//                                         style: TextStyle(
//                                             color: Colors.grey,
//                                             fontSize: SizerUtil.deviceType ==
//                                                     DeviceType.mobile
//                                                 ? 4.w
//                                                 : 3.w),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 2.h),
//                       SizedBox(height: 2.h),
//                       InkWell(
//                         onTap: () {
//                           // controller.navigateToNext(context);
//                         },
//                         child: Container(
//                           height: 8.h,
//                           padding: EdgeInsets.all(4.w),
//                           decoration: BoxDecoration(
//                               color: oxygenPrimaryColor,
//                               borderRadius: BorderRadius.circular(5.w)),
//                           child: Center(
//                             child: Text(
//                               "Next",
//                               style: TextStyle(
//                                 fontSize: 11.sp,
//                                 fontFamily: "Muli",
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
