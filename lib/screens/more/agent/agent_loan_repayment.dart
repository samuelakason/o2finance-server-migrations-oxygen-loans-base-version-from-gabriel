// // ignore_for_file: avoid_single_cascade_in_expression_statements

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_repayment_controller.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class AgentLoanRepaymentConfirmation extends StatelessWidget {
//   AgentLoanRepaymentConfirmation({Key? key}) : super(key: key);
//   final ctrl = Get.put(AgentLoanRepaymentController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanRepaymentController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Scaffold(
//             appBar: MyAppBar2("Loans"),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.all(5.w),
//                 child: Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 3.h),
//                       Text(
//                         "Please indicate repayment period",
//                         style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                             color: Color(0xFF093D49), fontSize: 13.sp),
//                       ),
//                       SizedBox(height: 3.h),
//                       RepaymentBox(
//                         onChanged: (bool? value) {
//                           controller.seven = value!;
//                           controller.fourteen = false;
//                           controller.thirty = false;
//                           controller.ninety = false;
//                           controller.validityDate = "7 days";
//                           controller.currentInterest = "8%";
//                           controller.interestRate = 8;
//                           controller.loanPeriod = 7;
//                           controller.endDate =
//                               DateTime.now().add(Duration(days: 7));
//                           controller.update();
//                         },
//                         title: '7 days',
//                         status: controller.seven,
//                       ),
//                       SizedBox(height: 2.h),
//                       RepaymentBox(
//                         onChanged: (bool? value) {
//                           controller.seven = false;
//                           controller.fourteen = value!;
//                           controller.thirty = false;
//                           controller.ninety = false;
//                           controller.validityDate = "14 days";
//                           controller.currentInterest = "15%";
//                           controller.interestRate = 15;
//                           controller.loanPeriod = 14;
//                           controller.endDate =
//                               DateTime.now().add(Duration(days: 14));
//                           controller.update();
//                         },
//                         title: '14 days',
//                         status: controller.fourteen,
//                       ),
//                       SizedBox(height: 2.h),
//                       RepaymentBox(
//                         onChanged: (bool? value) {
//                           controller.seven = false;
//                           controller.fourteen = false;
//                           controller.thirty = value!;
//                           controller.ninety = false;
//                           controller.validityDate = "30 days";
//                           controller.currentInterest = "30%";
//                           controller.interestRate = 30;
//                           controller.loanPeriod = 30;

//                           controller.endDate =
//                               DateTime.now().add(Duration(days: 30));
//                           controller..update();
//                         },
//                         title: '30 days',
//                         status: controller.thirty,
//                       ),
//                       SizedBox(height: 2.h),
//                       RepaymentBox(
//                         onChanged: (bool? value) {
//                           AwesomeDialog(
//                             context: context,
//                             animType: AnimType.RIGHSLIDE,
//                             headerAnimationLoop: true,
//                             dialogType: DialogType.ERROR,
//                             body: Center(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "You are not eligible for this repayment period, Apply for loans and pay on time to qualify",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontFamily: "Muli",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                                 ],
//                               ),
//                             ),
//                             buttonsTextStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontFamily: "Muli",
//                             ),
//                             desc: 'Your response has been saved',
//                             btnOkColor: Colors.red,
//                             btnOkText: "Ok",
//                             btnOkOnPress: () {},
//                           ).show();
//                         },
//                         title: '6 months',
//                         status: false,
//                       ),
//                       SizedBox(height: 2.h),
//                       RepaymentBox(
//                         onChanged: (bool? value) {
//                           AwesomeDialog(
//                             context: context,
//                             animType: AnimType.RIGHSLIDE,
//                             headerAnimationLoop: true,
//                             dialogType: DialogType.ERROR,
//                             body: Center(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "You are not eligible for this repayment period, Apply for loans and pay on time to qualify",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontFamily: "Muli",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                                 ],
//                               ),
//                             ),
//                             buttonsTextStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontFamily: "Muli",
//                             ),
//                             desc: 'Your response has been saved',
//                             btnOkColor: Colors.red,
//                             btnOkText: "Ok",
//                             btnOkOnPress: () {},
//                           ).show();
//                         },
//                         title: '12 months',
//                         status: false,
//                       ),
//                       SizedBox(height: 5.h),
//                       InkWell(
//                         onTap: () async {
//                           if (controller.validityDate != "") {
//                             await controller.calculateInterest();
//                             controller.showModal();
//                           } else {
//                             Get.snackbar('Succesful!',
//                                 "Please select your repayment period",
//                                 isDismissible: true,
//                                 shouldIconPulse: true,
//                                 snackPosition: SnackPosition.TOP,
//                                 colorText: Color(0xFF000000),
//                                 duration: const Duration(seconds: 5));
//                           }
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
//               ),
//             ),
//           );
//         });
//   }
// }

// class RepaymentBox extends StatelessWidget {
//   const RepaymentBox(
//       {Key? key,
//       required this.onChanged,
//       required this.title,
//       required this.status})
//       : super(key: key);
//   final Function(bool?)? onChanged;
//   final String title;
//   final bool status;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 1.w, bottom: 1.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(3.w),
//         boxShadow: const [
//           BoxShadow(
//               color: Color(0xFFBDBDBD),
//               blurRadius: 20.0,
//               offset: Offset(0.0, 0.75)),
//         ],
//       ),
//       width: 100.w,
//       child: Container(
//         decoration: BoxDecoration(),
//         child: Theme(
//           data: ThemeData(
//             checkboxTheme: CheckboxThemeData(
//               fillColor: MaterialStateProperty.all<Color>(oxygenPrimaryColor),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//             ),
//           ),
//           child: CheckboxListTile(
//             checkColor: Colors.white,
//             title: Text(
//               title,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText2!
//                   .copyWith(color: const Color(0xFF093D49), fontSize: 10.sp),
//             ),
//             value: status,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.w)),
//             onChanged: onChanged,
//           ),
//         ),
//       ),
//     );
//   }
// }
