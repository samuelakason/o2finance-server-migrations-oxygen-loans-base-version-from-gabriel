// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agents.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/agent_loan_stream.dart';
// import 'package:sizer/sizer.dart';

// class AgentLoanHistory extends StatelessWidget {
//   const AgentLoanHistory({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.h,
//       child: GetBuilder<AgentsController>(
//           initState: (controller) {},
//           builder: (controller) {
//             return DefaultTabController(
//                 length: 4,
//                 child: Column(
//                   children: [
//                     TabBar(
//                         isScrollable: true,
//                         unselectedLabelColor: Colors.grey,
//                         indicatorColor: oxygenPrimaryColor,
//                         labelColor: oxygenPrimaryColor,
//                         labelStyle: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           color: oxygenPrimaryColor,
//                         ),
//                         unselectedLabelStyle: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           color: Colors.grey,
//                         ),
//                         tabs: const [
//                           Tab(
//                             text: 'Pending',
//                           ),
//                           Tab(
//                             text: 'Approved',
//                           ),
//                           Tab(
//                             text: 'Completed',
//                           ),
//                           Tab(
//                             text: 'Declined',
//                           )
//                         ]),
//                     SizedBox(height: 1.h),
//                     Expanded(
//                       child: TabBarView(
//                         children: <Widget>[
//                           // AgentLoanStream(
//                           //     stream: OxygenApp.firestore
//                           //         .collection('agentLoans')
//                           //         .where('userId', isEqualTo: controller.userId)
//                           //         .where('status', isEqualTo: "0")
//                           //         .snapshots()),
//                           // AgentLoanStream(
//                           //   stream: OxygenApp.firestore
//                           //       .collection('agentLoans')
//                           //       .where('userId', isEqualTo: controller.userId)
//                           //       .where('status', isEqualTo: "1")
//                           //       .snapshots(),
//                           // ),
//                           // AgentLoanStream(
//                           //   stream: OxygenApp.firestore
//                           //       .collection('agentLoans')
//                           //       .where('userId', isEqualTo: controller.userId)
//                           //       .where('status', isEqualTo: "2")
//                           //       .snapshots(),
//                           // ),
//                           // AgentLoanStream(
//                           //   stream: OxygenApp.firestore
//                           //       .collection('agentLoans')
//                           //       .where('userId', isEqualTo: controller.userId)
//                           //       .where('status', isEqualTo: "3")
//                           //       .snapshots(),
//                           // )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ));
//           }),
//     );
//   }
// }
