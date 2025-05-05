// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/agents/agents.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:oxygen_loans/screens/more/agent/agent_loan_details.dart';
// import 'package:sizer/sizer.dart';

// class AgentLoanStream extends StatelessWidget {
//   AgentLoanStream({Key? key}) : super(key: key);

//   /// final Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
//   final ctrl = Get.put(AgentLoanDetailsController());
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//     // StreamBuilder(
//     //     stream: stream,
//     //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     //       if (!snapshot.hasData) {
//     //         return Center(
//     //           child: Column(
//     //             children: [
//     //               SizedBox(height: 10.h),
//     //               SpinKitDoubleBounce(
//     //                 color: oxygenPrimaryColor,
//     //                 size: 10.h,
//     //               ),
//     //             ],
//     //           ),
//     //         );
//     //       }

//     //       if (snapshot.data!.docs.isEmpty) {
//     //         return const Center(
//     //           child: NoItems(),
//     //         );
//     //       }

//     //       return Container(
//     //         constraints: BoxConstraints(
//     //           minHeight: 90.h,
//     //         ),
//     //         child: ListView.builder(
//     //           scrollDirection: Axis.vertical,
//     //           physics: NeverScrollableScrollPhysics(),
//     //           shrinkWrap: true,
//     //           itemCount: snapshot.data!.docs.length,
//     //           itemBuilder: (context, index) {
//     //             final DocumentSnapshot _card = snapshot.data!.docs[index];

//     //             return InkWell(
//     //               onTap: () {
//     //                 var loanDetails = Get.find<AgentLoanDetailsController>();

//     //                 loanDetails.loanID = _card['loanID'];
//     //                 loanDetails.interestAmount = _card['interest'].toString();
//     //                 loanDetails.status = _card['status'];
//     //                 loanDetails.matDate = _card['maturity'];
//     //                 loanDetails.loanAMount = _card['amount'];
//     //                 loanDetails.calPeriod = _card['calculationPeriod'];
//     //                 loanDetails.isDeclined = _card['isDeclined'];
//     //                 loanDetails.splitpayment = _card['splitPayment'];
//     //                 loanDetails.loanPeriod = _card['loanPeriod'];
//     //                 loanDetails.interestRate = _card['interestRate'];
//     //                 loanDetails.getStarted();
//     //                 Route route =
//     //                     MaterialPageRoute(builder: (_) => AgentLoanDetails());
//     //                 Navigator.push(context, route);
//     //               },
//     //               child: AgentLoanBox(
//     //                   title: _card['amount'],
//     //                   time:
//     //                       OxygenApp.timeFormat2.format(_card['date'].toDate()),
//     //                   icon: CupertinoIcons.check_mark),
//     //             );
//     //           },
//     //         ),
//     //       );
//     //     });
//   }
// }

// class AgentLoanBox extends StatelessWidget {
//   const AgentLoanBox(
//       {Key? key, required this.icon, required this.title, required this.time})
//       : super(key: key);
//   final IconData icon;
//   final String title, time;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(4.w),
//                     decoration: BoxDecoration(
//                         color: oxygenPrimaryColor, shape: BoxShape.circle),
//                     child: Icon(
//                       icon,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(width: 4.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF093D49),
//                         ),
//                       ),
//                       SizedBox(height: 1.h),
//                       Text(
//                         time,
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Icon(
//                 CupertinoIcons.chevron_right,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//           SizedBox(height: 2.h),
//           Divider(color: Colors.grey),
//           SizedBox(height: 2.h)
//         ],
//       ),
//     );
//   }
// }

// class NoItems extends StatelessWidget {
//   const NoItems({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Image.asset(
//             "assets/images/splash1.png",
//             height: 20.h,
//             width: 60.w,
//             fit: BoxFit.contain,
//           ),
//           SizedBox(height: 2.h),
//           Text(
//             "No items found",
//             style: TextStyle(
//                 fontSize: 10.sp, fontFamily: "Muli", color: Color(0xFF05242C)),
//           ),
//         ],
//       ),
//     );
//     ;
//   }
// }
