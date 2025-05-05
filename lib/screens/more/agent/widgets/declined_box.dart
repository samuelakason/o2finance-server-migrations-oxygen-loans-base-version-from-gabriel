// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentDeclinedBox extends StatelessWidget {
//   const AgentDeclinedBox({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Container(
//             padding: EdgeInsets.all(4.w),
//             child: Column(
//               children: [
//                 Text(
//                   "This loan has been declined",
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
