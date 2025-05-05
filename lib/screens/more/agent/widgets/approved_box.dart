// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_loan_details.dart';
// import 'package:oxygen_loans/controllers/loan_controllers/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class AgentApprovedBox extends StatelessWidget {
//   const AgentApprovedBox({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentLoanDetailsController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Container(
//             padding: EdgeInsets.all(4.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "This loan is due on " +
//                       OxygenApp.timeFormat2
//                           .format(DateTime.parse(controller.matDate)) +
//                       ", you can pay back right now by clicking on the button below ",
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
//                         title: "Due date",
//                         value: OxygenApp.timeFormat2
//                             .format(DateTime.parse(controller.matDate)),
//                       ),
//                 SizedBox(height: 2.h),
//                 Divider(color: Colors.grey),
//                 SizedBox(height: 4.h),
//                 Visibility(
//                     visible: !controller.alreadyPayingSPlit,
//                     child: MainButton(
//                         title: "Pay back",
//                         callback: () {
//                           if (controller.skTest != null) {
//                             controller.isPayingFull = true;
//                             controller.isPayingSplit = false;
//                             controller.showModal3();
//                           } else {
//                             controller.getKeys();
//                             AwesomeDialog(
//                               context: context,
//                               animType: AnimType.RIGHSLIDE,
//                               headerAnimationLoop: true,
//                               dialogType: DialogType.ERROR,
//                               body: Center(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                         height: SizerUtil.deviceType ==
//                                                 DeviceType.mobile
//                                             ? 1.h
//                                             : 4.h),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         "Please check your internet connection and try again",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 10.sp,
//                                           fontFamily: "Muli",
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                         height: SizerUtil.deviceType ==
//                                                 DeviceType.mobile
//                                             ? 1.h
//                                             : 4.h)
//                                   ],
//                                 ),
//                               ),
//                               buttonsTextStyle: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontFamily: "Muli",
//                               ),
//                               desc: 'Your response has been saved',
//                               btnOkIcon: Icons.cancel,
//                               btnOkColor: Colors.red,
//                               btnOkOnPress: () {},
//                             )..show();
//                           }
//                         })),
//                 SizedBox(height: 1.h),
//                 Visibility(
//                   visible: controller.splittable,
//                   child: controller.splitpayment
//                       ? InkWell(
//                           onTap: () {
//                             if (controller.skTest != null) {
//                               controller.isPayingSplit = true;
//                               controller.isPayingFull = false;
//                               controller.showModal3();
//                             } else {
//                               controller.getKeys();
//                               AwesomeDialog(
//                                 context: context,
//                                 animType: AnimType.RIGHSLIDE,
//                                 headerAnimationLoop: true,
//                                 dialogType: DialogType.ERROR,
//                                 body: Center(
//                                   child: Column(
//                                     children: [
//                                       SizedBox(
//                                           height: SizerUtil.deviceType ==
//                                                   DeviceType.mobile
//                                               ? 1.h
//                                               : 4.h),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           "Please check your internet connection and try again",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             fontSize: 10.sp,
//                                             fontFamily: "Muli",
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           height: SizerUtil.deviceType ==
//                                                   DeviceType.mobile
//                                               ? 1.h
//                                               : 4.h)
//                                     ],
//                                   ),
//                                 ),
//                                 buttonsTextStyle: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: "Muli",
//                                 ),
//                                 desc: 'Your response has been saved',
//                                 btnOkIcon: Icons.cancel,
//                                 btnOkColor: Colors.red,
//                                 btnOkOnPress: () {},
//                               )..show();
//                             }
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: oxygenPrimaryColor),
//                                 borderRadius: BorderRadius.circular(3.w),
//                                 color: Colors.white),
//                             height: 7.h,
//                             padding: EdgeInsets.all(3.w),
//                             margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
//                             width: 100.w,
//                             child: Center(
//                               child: Text(
//                                 "Pay in installments ",
//                                 style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontFamily: "Muli",
//                                   fontWeight: FontWeight.w400,
//                                   color: oxygenPrimaryColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       : Container(),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
