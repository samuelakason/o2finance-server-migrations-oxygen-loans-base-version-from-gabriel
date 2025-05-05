// // ignore_for_file: avoid_single_cascade_in_expression_statements


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/form_validation.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_get_loan.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/get_loan.dart';
// import 'package:oxygen_loans/screens/loans/Id_means.dart';
// import 'package:oxygen_loans/screens/loans/loan_repayment_confirmation.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/screens/widgets/form_field1.dart';
// import 'package:sizer/sizer.dart';

// class AgentGetloan extends StatefulWidget {
//   const AgentGetloan({Key? key}) : super(key: key);

//   @override
//   _AgentGetloanState createState() => _AgentGetloanState();
// }

// class _AgentGetloanState extends State<AgentGetloan>
//     with TickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<Offset>? _animation;
//   final ctrl = Get.put(AgentGetLoanController());
//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);

//     _animation = Tween<Offset>(
//       begin: const Offset(0, 0.1),
//       end: const Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller!,
//       curve: Curves.bounceIn,
//     ));
//   }

//   @override
//   dispose() {
//     _controller!.dispose(); // you need this
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentGetLoanController>(
//         initState: (_) {},
//         builder: (controller) {
//           return Scaffold(
//             appBar: MyAppBar2("Loans"),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(5.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 2.h),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: SlideTransition(
//                         position: _animation!,
//                         transformHitTests: true,
//                         textDirection: TextDirection.ltr,
//                         child: Container(
//                           height: 20.h,
//                           width: 20.h,
//                           padding: EdgeInsets.all(5.w),
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: oxygenPrimaryColor),
//                           child: Center(
//                             child: controller.isCalculated == false
//                                 ? Text(
//                                     "0",
//                                     style: TextStyle(
//                                       fontSize: 20.sp,
//                                       fontFamily: "Muli",
//                                       fontWeight: FontWeight.w400,
//                                       color: Colors.white,
//                                     ),
//                                   )
//                                 : Text(
//                                     "₦" + controller.maxLoan.toString(),
//                                     style: TextStyle(
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.w400,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 2.h),
//                     controller.isCalculated == false
//                         ? Text(
//                             "Please wait.... we are calculating your best loan amount",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xFF093D49),
//                             ),
//                           )
//                         : Text(
//                             "This is your current loan limit, repay your loan promptly to increase this amount",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xFF093D49),
//                             ),
//                           ),
//                     SizedBox(height: 2.h),
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "Loan amount",
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 1.h),
//                     FormField2(
//                       ctrl: controller.loanAmountTextEditingController,
//                       isObscure: false,
//                       hint: "Loan amount",
//                       validator: (value) {
//                         return AppFormValidation().validateText(value!);
//                       },
//                       onSaved: (value) {
//                         //controller.address = value!;
//                       },
//                     ),
//                     SizedBox(height: 2.h),
//                     Text(
//                       "What is the loan",
//                       style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           color: Colors.grey),
//                     ),
//                     SizedBox(height: 1.h),
//                     DecoratedBox(
//                         decoration: ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side: const BorderSide(
//                                 width: 1.0,
//                                 style: BorderStyle.solid,
//                                 color: oxygenPrimaryColor),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.w)),
//                           ),
//                         ),
//                         child: Container(
//                             width: 100.w,
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 2.h, vertical: 2.h),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                   value: controller.currentloanReason,
//                                   isDense: true,
//                                   onChanged: (newValue) {
//                                     controller.currentloanReason = newValue!;
//                                     controller.update();
//                                   },
//                                   items:
//                                       controller.loanReason.map((String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(
//                                         value,
//                                         style: TextStyle(
//                                             color: value == 'Please select'
//                                                 ? Colors.grey
//                                                 : Colors.black,
//                                             fontSize: SizerUtil.deviceType ==
//                                                     DeviceType.mobile
//                                                 ? 4.w
//                                                 : 3.w),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             ))),
//                     SizedBox(height: 3.h),
//                     InkWell(
//                       onTap: () {
//                         if (controller.loanAmountTextEditingController.text
//                                 .isNotEmpty &&
//                             controller.currentloanReason != "Please select") {
//                           if (int.parse(controller
//                                   .loanAmountTextEditingController.text
//                                   .trim()) <=
//                               controller.maxLoan) {
//                             controller.navigateToNext();
//                           } else {
//                             Get.snackbar('Error!',
//                                 "Invalid loan amount entered, please enter a value within your loan limit",
//                                 isDismissible: true,
//                                 shouldIconPulse: true,
//                                 snackPosition: SnackPosition.TOP,
//                                 colorText: Color(0xFF000000),
//                                 duration: const Duration(seconds: 5));
//                           }
//                         } else {
//                           Get.snackbar('Error!', "Please complete form",
//                               isDismissible: true,
//                               shouldIconPulse: true,
//                               snackPosition: SnackPosition.TOP,
//                               colorText: Color(0xFF000000),
//                               duration: const Duration(seconds: 5));
//                         }
//                       },
//                       child: Container(
//                         height: 8.h,
//                         padding: EdgeInsets.all(4.w),
//                         decoration: BoxDecoration(
//                             color: oxygenPrimaryColor,
//                             borderRadius: BorderRadius.circular(5.w)),
//                         child: Center(
//                           child: Text(
//                             "Next",
//                             style: TextStyle(
//                               fontSize: 11.sp,
//                               fontFamily: "Muli",
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
