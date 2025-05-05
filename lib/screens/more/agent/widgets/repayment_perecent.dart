// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentRepaymentPerecent extends StatelessWidget {
//   const AgentRepaymentPerecent({Key? key}) : super(key: key);

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
//             child: controller.isLoading
//                 ? SpinKitDoubleBounce(color: oxygenPrimaryColor, size: 15.h)
//                 : Column(
//                     children: [
//                       Image.asset("assets/images/card2.png", height: 20.h),
//                       Text("Select your desired repayment percentage",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText2!
//                               .copyWith(fontSize: 12.sp, color: Colors.black)),
//                       SizedBox(height: 2.h),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Visibility(
//                             visible: !controller.payRecord.contains("30"),
//                             child: InkWell(
//                               onTap: () async {
//                                 controller.percentagePay = "30";

//                                 int loaned =
//                                     int.parse(controller.loanAMount.toString());
//                                 int interestToPay = int.parse(
//                                     controller.interestAmount.toString());

//                                 int totalRepayFirst = (loaned +
//                                         interestToPay +
//                                         controller.addedDefault) *
//                                     100;

//                                 controller.totalRepay =
//                                     ((30 / 100) * totalRepayFirst).round();
//                                 if (controller.newCard) {
//                                   controller.chargeCard();
//                                 } else {
//                                   controller.chargeAuth();
//                                 }
//                               },
//                               child: Container(
//                                 height: 15.h,
//                                 width: 30.w,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: oxygenPrimaryColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Color(0xFFBDBDBD),
//                                         blurRadius: 5.0,
//                                         offset: Offset(0.0, 0.75)),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "30%",
//                                     style: TextStyle(
//                                         fontSize: 15.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Visibility(
//                             visible: !controller.payRecord.contains("31"),
//                             child: InkWell(
//                               onTap: () {
//                                 controller.percentagePay = "31";
//                                 int loaned =
//                                     int.parse(controller.loanAMount.toString());
//                                 int interestToPay = int.parse(
//                                     controller.interestAmount.toString());

//                                 int totalRepayFirst = (loaned +
//                                         interestToPay +
//                                         controller.addedDefault) *
//                                     100;

//                                 controller.totalRepay =
//                                     ((30 / 100) * totalRepayFirst).round();
//                                 print(totalRepayFirst.toString() +
//                                     'totalRepayFirst...');
//                                 if (controller.newCard) {
//                                   controller.chargeCard();
//                                 } else {
//                                   controller.chargeAuth();
//                                 }
//                               },
//                               child: Container(
//                                 height: 15.h,
//                                 width: 30.w,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: oxygenPrimaryColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Color(0xFFBDBDBD),
//                                         blurRadius: 5.0,
//                                         offset: Offset(0.0, 0.75)),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "30%",
//                                     style: TextStyle(
//                                         fontSize: 15.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Visibility(
//                             visible: !controller.payRecord.contains("40"),
//                             child: InkWell(
//                               onTap: () {
//                                 controller.percentagePay = "40";
//                                 int loaned =
//                                     int.parse(controller.loanAMount.toString());
//                                 int interestToPay = int.parse(
//                                     controller.interestAmount.toString());

//                                 int totalRepayFirst = (loaned +
//                                         interestToPay +
//                                         controller.addedDefault) *
//                                     100;
//                                 controller.totalRepay =
//                                     ((40 / 100) * totalRepayFirst).round();
//                                 if (controller.newCard) {
//                                   controller.chargeCard();
//                                 } else {
//                                   controller.chargeAuth();
//                                 }
//                               },
//                               child: Container(
//                                 height: 15.h,
//                                 width: 30.w,
//                                 decoration: const BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: oxygenPrimaryColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Color(0xFFBDBDBD),
//                                         blurRadius: 5.0,
//                                         offset: Offset(0.0, 0.75)),
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "40%",
//                                     style: TextStyle(
//                                         fontSize: 15.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//           );
//         });
//   }
// }
