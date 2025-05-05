// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentCardOption extends StatelessWidget {
//   const AgentCardOption({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Container(
//             padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(5.w),
//                 topRight: Radius.circular(5.w),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Image.asset("assets/images/card.png", height: 20.h),
//                 SizedBox(height: 4.h),
//                 InkWell(
//                   onTap: () {
//                     controller.newCard = true;
//                     if (controller.isPayingSplit) {
//                       Navigator.pop(context);
//                       controller.showModal2();
//                     } else {
//                       controller.chargeCard();
//                     }
//                   },
//                   child: Container(
//                     width: 100.w,
//                     height: 7.h,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: oxygenPrimaryColor, width: 1),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color(0xFFf1f0f0),
//                           blurRadius: 5.0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(3.w),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Pay with new card",
//                         style: TextStyle(
//                             fontSize: 11.sp,
//                             fontFamily: "Muli",
//                             color: oxygenPrimaryColor),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 InkWell(
//                   onTap: () {
//                     controller.newCard = false;
//                     Navigator.pop(context);
//                     controller.showModal4();
//                   },
//                   child: Container(
//                     width: 100.w,
//                     height: 7.h,
//                     decoration: BoxDecoration(
//                       color: oxygenPrimaryColor,
//                       border: Border.all(color: oxygenPrimaryColor, width: 1),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color(0xFFf1f0f0),
//                           blurRadius: 5.0,
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(3.w),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Pay with saved card",
//                         style: TextStyle(
//                             fontSize: 11.sp,
//                             fontFamily: "Muli",
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
