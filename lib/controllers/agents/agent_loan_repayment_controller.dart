// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/loans/loan_repayment_confirmation.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/services/global_context.dart';
// import 'package:oxygen_loans/services/push_notification_service.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class AgentLoanRepaymentController extends GetxController {
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getAdminFcmToken();
//   }

//   // final TextEditingController idNumberTextEditingController =
//   //     TextEditingController();
//   String currentInterest = "";

//   String loanAmount =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.loanAmount).toString();
//   bool seven = false;
//   bool fourteen = false;
//   bool thirty = false;
//   bool ninety = false;
//   bool six = false;
//   bool twelve = false;
//   String validityDate = "";
//   int interest = 0;
//   String adminToken1 = '';
//   String adminToken2 = '';
//   int interestRate = 8;
//   int loanPeriod = 7;
//   bool accepted = false;

//   DateTime endDate = DateTime.now().add(const Duration(days: 7));
//   PushNotificationService pushNotificationService = PushNotificationService();
//   Future<void> calculateInterest() async {
//     int p = int.parse(loanAmount.toString());
//     if (validityDate == "7 days") {
//       String maturityDate = DateTime.now()
//           .add(Duration(days: 7, hours: 0, minutes: 1))
//           .toString();
//       interest = ((8 / 100) * p).round();
//     } else if (validityDate == "14 days") {
//       String maturityDate =
//           DateTime.now().add(Duration(days: 14, hours: 5)).toString();
//       interest = ((15 / 100) * p).round();
//     } else if (validityDate == "30 days") {
//       String maturityDate =
//           DateTime.now().add(Duration(days: 30, hours: 5)).toString();
//       interest = ((30 / 100) * p).round();
//     }
//   }

//   // Future<void> saveToprefs() async {
//   //   await OxygenApp.sharedPreferences!.setString(
//   //       OxygenApp.idNumber, idNumberTextEditingController.text.trim());
//   // }

//   saveTofirestore() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();

//     OxygenApp.firestore.collection("users").doc(userID).update({
//       "isLoanActive": "1",
//       "previousLoan": loanAmount,
//     }).then((value) async {
//       await OxygenApp.sharedPreferences!
//           .setBool(OxygenApp.isCompleteProfile, true);
//     });

//     OxygenApp.firestore.collection("adminNotifications").doc().set({
//       "text": "An agent has applied for a loan of $loanAmount",
//       "time": DateTime.now()
//           .add(Duration(days: 0, hours: 0, minutes: 0))
//           .toString(),
//     });

//     OxygenApp.firestore
//         .collection("users")
//         .doc("slwroSOR1nVG3M6uUHwuy454fBl2")
//         .update({
//       "unViewed": true,
//     });
//     OxygenApp.firestore
//         .collection("users")
//         .doc("zWAoct61hbNMw23tjTOPkZLRI6o1")
//         .update({
//       "unViewed": true,
//     });

//     await pushNotificationService.sendPushNotification(
//         adminToken1,
//         'New Agent Loan Application',
//         "A user has applied for a loan of $loanAmount");
//     await pushNotificationService.sendPushNotification(
//         adminToken2,
//         'New Agent Loan Application',
//         "A user has applied for a loan of $loanAmount");
//   }

//   Future<void> getAdminFcmToken() async {
//     var admin1 = await OxygenApp.firestore
//         .collection('users')
//         .doc('slwroSOR1nVG3M6uUHwuy454fBl2')
//         .get();

//     var admin2 = await OxygenApp.firestore
//         .collection('users')
//         .doc('zWAoct61hbNMw23tjTOPkZLRI6o1')
//         .get();

//     adminToken1 = admin1["fcmToken"];
//     adminToken2 = admin2["fcmToken"];
//   }

//   // navigateToNext() {
//   //   saveToprefs().then((value) {
//   //     Route route =
//   //         MaterialPageRoute(builder: (_) => LoanRepaymentConfirmation());
//   //     Navigator.push(GlobalContextService.navigatorKey.currentContext!, route);
//   //   });
//   // }

//   saveLoanData() {
//     LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);

//     DocumentReference documentReference =
//         OxygenApp.firestore.collection('agentLoans').doc();
//     String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);
//     String? username =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userName);

//     int p = int.parse(loanAmount.toString());

//     String maturityDate = DateTime.now()
//         .add(const Duration(days: 0, hours: 0, minutes: 1))
//         .toString();
//     interest = ((interestRate / 100) * p).round();
//     bool isPayingSplit = interestRate == 30;
//     documentReference.set({
//       "loanID": documentReference.id,
//       "userId": userID,
//       "interest": interest,
//       "amount": loanAmount,
//       "date": DateTime.now(),
//       "maturity": maturityDate,
//       "isDeclined": false,
//       "splitPayment": isPayingSplit,
//       "isPayingSplit": false,
//       "paymentRecord": [],
//       "interestRate": interestRate,
//       "loanPeriod": loanPeriod,
//       "alreadyPayingSPlit": false,
//       "paidOnTime": false,
//       'username': username,
//       "calculationPeriod":
//           DateTime.now().add(Duration(days: loanPeriod, hours: 0, minutes: 30)),
//       "status": "0",
//     }).then((value) async {
//       saveTofirestore();
//       await OxygenApp.sharedPreferences!.setString(OxygenApp.isLoanActive, "1");
//       accepted = true;
//       update();
//       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//     });
//   }

//   showModal() {
//     showModalBottomSheet(
//       context: GlobalContextService.navigatorKey.currentContext!,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return GetBuilder<AgentLoanRepaymentController>(
//             initState: (controller) {},
//             builder: (controller) {
//               return GestureDetector(
//                   onTap: () => Navigator.of(context, rootNavigator: true).pop(),
//                   child: Container(
//                     color: Color.fromRGBO(0, 0, 0, 0.001),
//                     child: GestureDetector(
//                       onTap: () {},
//                       child: DraggableScrollableSheet(
//                         initialChildSize: 0.52,
//                         minChildSize: 0.2,
//                         maxChildSize: 0.52,
//                         builder: (_, controller) {
//                           return Container(
//                             padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(5.w),
//                                 topRight: Radius.circular(5.w),
//                               ),
//                             ),
//                             child: accepted == false
//                                 ? Column(
//                                     children: [
//                                       SizedBox(height: 2.h),
//                                       SizedBox(height: 1.h),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Loan",
//                                             style: TextStyle(
//                                               fontSize: 13.sp,
//                                               fontFamily: "Muli",
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF05242C),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(4.w),
//                                             decoration: BoxDecoration(
//                                                 color: Color(0xFFebecf0),
//                                                 borderRadius:
//                                                     BorderRadius.circular(4.w)),
//                                             child: Text(
//                                               "₦" + loanAmount,
//                                               style: TextStyle(
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xFF05242C),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 1.h),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Interest",
//                                             style: TextStyle(
//                                               fontSize: 13.sp,
//                                               fontFamily: "Muli",
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF05242C),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(4.w),
//                                             decoration: BoxDecoration(
//                                                 color: Color(0xFFebecf0),
//                                                 borderRadius:
//                                                     BorderRadius.circular(4.w)),
//                                             child: Text(
//                                               "₦" + interest.toString(),
//                                               style: TextStyle(
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xFF05242C),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 1.h),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             "Maturity date",
//                                             style: TextStyle(
//                                               fontSize: 13.sp,
//                                               fontFamily: "Muli",
//                                               fontWeight: FontWeight.bold,
//                                               color: Color(0xFF05242C),
//                                             ),
//                                           ),
//                                           Container(
//                                             padding: EdgeInsets.all(4.w),
//                                             decoration: BoxDecoration(
//                                                 color: Color(0xFFebecf0),
//                                                 borderRadius:
//                                                     BorderRadius.circular(4.w)),
//                                             child: Text(
//                                               OxygenApp.timeFormat2
//                                                   .format(endDate),
//                                               style: TextStyle(
//                                                 fontSize: 13.sp,
//                                                 fontFamily: "Muli",
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color(0xFF05242C),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 3.h),
//                                       MainButton(
//                                           title: "Yes, confirm request",
//                                           callback: () {
//                                             saveLoanData();
//                                           }),
//                                       SizedBox(height: 2.h),
//                                       MainButton(
//                                           title: "Cancel",
//                                           callback: () {
//                                             Navigator.pop(context);
//                                           })
//                                     ],
//                                   )
//                                 : Column(
//                                     children: [
//                                       SizedBox(height: 4.h),
//                                       SvgPicture.asset(
//                                         "assets/icons/agent.svg",
//                                         height: 25.h,
//                                       ),
//                                       SizedBox(height: 2.h),
//                                       Text(
//                                         "Loan request of ₦$loanAmount has been recieved and pending aproval",
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText2!
//                                             .copyWith(
//                                                 color: const Color(0xFF093D49),
//                                                 fontSize: 13.sp),
//                                       ),
//                                       SizedBox(height: 4.h),
//                                       MainButton(
//                                           title: "Okay",
//                                           callback: () {
//                                             Route route = MaterialPageRoute(
//                                                 builder: (_) =>
//                                                     MainScreen(sIndex: 0));
//                                             Navigator.pushReplacement(
//                                                 context, route);
//                                           })
//                                     ],
//                                   ),
//                           );
//                         },
//                       ),
//                     ),
//                   ));
//             });
//       },
//     );
//   }
// }
