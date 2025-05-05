// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/services/global_context.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class AgentApplicationController extends GetxController {
//   final TextEditingController locationCtrl = TextEditingController();
//   final TextEditingController loanCustomersCtrl = TextEditingController();

//   showModal(String message) {
//     showModalBottomSheet(
//       context: GlobalContextService.navigatorKey.currentContext!,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         bool accepted = false;
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter mystate) {
//           return GestureDetector(
//               onDoubleTap: () =>
//                   Navigator.of(context, rootNavigator: true).pop(),
//               child: Container(
//                 color: Color.fromRGBO(0, 0, 0, 0.001),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: DraggableScrollableSheet(
//                     initialChildSize: 0.4,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.40,
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
//                             SizedBox(height: 4.h),
//                             Icon(
//                               CupertinoIcons.check_mark_circled,
//                               color: oxygenPrimaryColor,
//                               size: 12.h,
//                             ),
//                             Text(
//                               message,
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
//                                       builder: (_) => MainScreen(sIndex: 4));
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
//       },
//     );
//   }

//   sendApplication() {
//     LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);

//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     DocumentReference documentReference =
//         OxygenApp.firestore.collection("agentApplications").doc(userID);

//     documentReference.set({
//       "applicationID": documentReference.id,
//       "userID": OxygenApp.sharedPreferences!.getString(OxygenApp.userUID),
//       "firstname": OxygenApp.sharedPreferences!.getString(OxygenApp.firstName),
//       "lastname": OxygenApp.sharedPreferences!.getString(OxygenApp.lastName),
//       "location": locationCtrl.text.trim(),
//       "custormers": loanCustomersCtrl.text.trim(),
//       "date": DateTime.now(),
//       "status": false,
//       "isApproved": "0"
//     }).then((value) {
//       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//       showModal(
//           " Your application has been successfully, please dont send multiple application ");
//     });
//   }
// }
