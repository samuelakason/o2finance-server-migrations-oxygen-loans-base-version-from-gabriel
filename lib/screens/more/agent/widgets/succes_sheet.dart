// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class SuccesSheet extends StatelessWidget {
//   const SuccesSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller2) {},
//         builder: (controller2) {
//           return GestureDetector(
//               onTap: () => Navigator.of(context, rootNavigator: true).pop(),
//               child: Container(
//                 color: Color.fromRGBO(0, 0, 0, 0.001),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: DraggableScrollableSheet(
//                     initialChildSize: 0.46,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.46,
//                     builder: (_, controller) {
//                       return Container(
//                         padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(5.w),
//                             topRight: Radius.circular(5.w),
//                           ),
//                         ),
//                         child: Column(
//                           children: [
//                             SvgPicture.asset(
//                               "assets/icons/agent.svg",
//                               height: 25.h,
//                             ),
//                             SizedBox(height: 4.h),
//                             Text(
//                               "Your payment has been recieved",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   fontFamily: "Muli",
//                                   color: Colors.black),
//                             ),
//                             SizedBox(height: 4.h),
//                             MainButton(
//                                 title: "Okay",
//                                 callback: () {
//                                   Route route = MaterialPageRoute(
//                                       builder: (_) => MainScreen(sIndex: 0));
//                                   Navigator.pushReplacement(context, route);
//                                 })
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ));
//         });
//   }
// }
