// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agents.dart';
// import 'package:oxygen_loans/screens/loans/get_loan.dart';
// import 'package:oxygen_loans/screens/loans/loan_permission.dart';
// import 'package:oxygen_loans/screens/loans/user_basic_info.dart';
// import 'package:oxygen_loans/screens/more/agent/agent_application.dart';
// import 'package:oxygen_loans/screens/more/agent/agent_get_loan.dart';
// import 'package:oxygen_loans/screens/more/agent/agent_loan_details.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/agent_loan_history.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class Agent extends StatefulWidget {
//   const Agent({Key? key}) : super(key: key);

//   @override
//   _AgentState createState() => _AgentState();
// }

// class _AgentState extends State<Agent> with TickerProviderStateMixin {
//   final ctrl = Get.put(AgentsController());
//   @override
//   void initState() {
//     super.initState();
//     ctrl.tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Scaffold(
//             appBar: MyAppBar2("Agent"),
//             body: Container(
//                 padding: EdgeInsets.all(4.w),
//                 child: controller.isProfileFound == false
//                     ? SpinKitDoubleBounce(
//                         color: oxygenPrimaryColor,
//                         size: 10.h,
//                       )
//                     : controller.isAgent == true
//                         ? AgentLoanHistory()
//                         : controller.isAgent == false
//                             ? NotAgent()
//                             : Container()),
//             floatingActionButton: controller.isAgent
//                 ? FloatingActionButton.extended(
//                     backgroundColor: oxygenPrimaryColor,
//                     onPressed: () {
//                       Route route =
//                           MaterialPageRoute(builder: (_) => AgentGetloan());
//                       Navigator.push(context, route);
//                     },
//                     label: Text(
//                       "Get a Loan",
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         fontFamily: "Muli",
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 : Container(),
//           );
//         });
//   }
// }

// class NotAgent extends StatelessWidget {
//   const NotAgent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Center(
//           child: SvgPicture.asset(
//             "assets/icons/agent.svg",
//             height: 35.h,
//           ),
//         ),
//         SizedBox(height: 3.h),
//         Text(
//           "An easy an effective way to earn, be our agent, no registration fee required.",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 14.sp,
//             fontFamily: "Muli",
//             color: Color(0xFF4F4F4F),
//           ),
//         ),
//         SizedBox(height: 17.h),
//         MainButton(
//             title: "Apply to be an agent",
//             callback: () {
//               Route route =
//                   MaterialPageRoute(builder: (_) => AgentApplication());
//               Navigator.push(context, route);
//             })
//       ],
//     );
//   }
// }
