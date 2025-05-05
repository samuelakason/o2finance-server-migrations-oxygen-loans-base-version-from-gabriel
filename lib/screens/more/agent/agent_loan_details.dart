// // ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

// import 'dart:convert';
// import 'dart:io';


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/screens/loans/widgets/approved_box.dart';
// import 'package:oxygen_loans/screens/loans/widgets/completed_box.dart';
// import 'package:oxygen_loans/screens/loans/widgets/declined_box.dart';
// import 'package:oxygen_loans/screens/loans/widgets/pending_box.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/approved_box.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/completed_box.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/declined_box.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/pending_box.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';
// import 'package:http/http.dart' as http;

// class AgentLoanDetails extends StatefulWidget {
//   AgentLoanDetails({Key? key}) : super(key: key);

//   @override
//   _LoanDetailsState createState() => _LoanDetailsState();
// }

// class _LoanDetailsState extends State<AgentLoanDetails>
//     with TickerProviderStateMixin {
//   var loanDetails = Get.find<AgentLoanDetailsController>();
//   @override
//   void initState() {
//     super.initState();
//     loanDetails.animationController = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);

//     loanDetails.animation = Tween<Offset>(
//       begin: Offset(0, 0.1),
//       end: Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: loanDetails.animationController!,
//       curve: Curves.bounceIn,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Scaffold(
//             appBar: MyAppBar2("Loan details"),
//             body: getBody(),
//           );
//         });
//   }

//   Widget getBody() {
//     if (loanDetails.status == "0") {
//       return AgentPendingBox();
//     } else if (loanDetails.status == "1") {
//       return AgentApprovedBox();
//     } else if (loanDetails.status == "2") {
//       return AgentCompletedBox();
//     } else if (loanDetails.status == "3") {
//       return AgentDeclinedBox();
//     } else {
//       return Container();
//     }
//   }
// }

// class LoanDetailBox extends StatelessWidget {
//   const LoanDetailBox({Key? key, required this.title, required this.value})
//       : super(key: key);
//   final String title, value;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
//         ),
//         Container(
//           width: 100.w,
//           padding: EdgeInsets.all(4.w),
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(3.w)),
//           child: Text(
//             value,
//             style: TextStyle(
//                 fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
//           ),
//         ),
//       ],
//     ));
//   }
// }

// class CardInfo extends StatelessWidget {
//   const CardInfo(
//       {Key? key,
//       required this.bank,
//       required this.lastFour,
//       required this.cardID})
//       : super(key: key);
//   final String bank, lastFour, cardID;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFFf1f0f0),
//               blurRadius: 5.0,
//             ),
//           ],
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(5.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       bank,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       lastFour,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Icon(
//                     CupertinoIcons.chevron_right,
//                     size: 25.sp,
//                     color: Colors.blue,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
