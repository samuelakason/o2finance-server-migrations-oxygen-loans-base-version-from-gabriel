// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentPendingBox extends StatelessWidget {
//   const AgentPendingBox({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Container(
//             padding: EdgeInsets.all(4.w),
//             child: Column(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: SlideTransition(
//                     position: controller.animation!,
//                     transformHitTests: true,
//                     textDirection: TextDirection.ltr,
//                     child: Container(
//                       height: 25.h,
//                       width: 25.h,
//                       padding: EdgeInsets.all(5.w),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: oxygenPrimaryColor),
//                       child: Center(
//                         child: CountdownTimer(
//                           textStyle: TextStyle(
//                             fontSize: 15.sp,
//                             fontFamily: "Muli",
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                           endTime: controller.endTime,
//                           endWidget: Text(
//                             "00:00:00",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 15.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 Text(
//                   "Please wait.... Your loan will soon be approved",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF093D49),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(
//                         title: "Loan amount", value: controller.loanAMount),
//                 SizedBox(height: 2.h),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(title: "Loan ID", value: controller.loanID),
//                 SizedBox(height: 2.h),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(
//                         title: "Due date",
//                         value: OxygenApp.timeFormat2
//                             .format(DateTime.parse(controller.matDate)),
//                       ),
//                 SizedBox(height: 2.h),
//               ],
//             ),
//           );
//         });
//   }
// }
