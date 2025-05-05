// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentCompletedBox extends StatelessWidget {
//   const AgentCompletedBox({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Container(
//               padding: EdgeInsets.all(4.w),
//               child: Column(children: [
//                 Text(
//                   "This loan has been repaid ",
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w400,
//                     color: Color(0xFF093D49),
//                   ),
//                 ),
//                 SizedBox(height: 3.h),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(
//                         title: "Loan amount", value: controller.loanAMount),
//                 SizedBox(height: 2.h),
//                 Divider(color: Colors.grey),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(title: "Loan ID", value: controller.loanID),
//                 SizedBox(height: 2.h),
//                 Divider(color: Colors.grey),
//                 controller.loanAMount == ""
//                     ? Align(
//                         alignment: Alignment.bottomLeft,
//                         child: CircularProgressIndicator())
//                     : LoanDetailBox(
//                         title: "Maturity date",
//                         value: OxygenApp.timeFormat2
//                             .format(DateTime.parse(controller.matDate)),
//                       ),
//               ]));
//         });
//     ;
//   }
// }
