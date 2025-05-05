import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/services/push_notification_service.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class OffPlanSalesController extends GetxController {
  List image = [];
  int quantity = 1;
  bool isSaved = false;
  int unitsBuy = 0;
  int totalPrice = 0;
  PushNotificationService pushNotificationService = PushNotificationService();
  String adminToken1 = '';
  String adminToken2 = '';
  String buildingID = '';
  String name = '';
  String desc = '';
  String location = '';
  String state = '';

  @override
  void onInit() {
    super.onInit();

    // getAdminFcmToken();
  }

  // registerPurchase() async {
  //   LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
  //   DocumentReference documentReference =
  //       OxygenApp.firestore.collection("buildingPurchase").doc();
  //   String userID =
  //       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  //   documentReference.set({
  //     "buidlingName": name,
  //     "purchaseID": documentReference.id,
  //     "buildingID": buildingID,
  //     "user": userID,
  //     "payments": [],
  //     "units": quantity,
  //     "totalPrice": totalPrice,
  //   }).then((value) async {
  //     print("done......");

  //     var loanDetails = await OxygenApp.firestore
  //         .collection("buildingProjects")
  //         .doc(buildingID)
  //         .get();

  //     int pUnits = int.parse(loanDetails["units"].toString());

  //     OxygenApp.firestore
  //         .collection("buildingProjects")
  //         .doc(buildingID)
  //         .update({
  //       "units": pUnits - quantity,
  //     }).then((value) {
  //       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //       showModal2(
  //           "Your purchase has been registered, please contact support or head over to our office for further instructions on how to complete your purchase");
  //     });
  //   });

  //   OxygenApp.firestore.collection("adminNotifications").doc().set({
  //     "text": "A user has indicated interest in real estate",
  //     "time": DateTime.now()
  //         .add(Duration(days: 0, hours: 0, minutes: 0))
  //         .toString(),
  //   });

  //   OxygenApp.firestore
  //       .collection("users")
  //       .doc("slwroSOR1nVG3M6uUHwuy454fBl2")
  //       .update({
  //     "unViewed": true,
  //   });
  //   OxygenApp.firestore
  //       .collection("users")
  //       .doc("zWAoct61hbNMw23tjTOPkZLRI6o1")
  //       .update({
  //     "unViewed": true,
  //   });

  //   await pushNotificationService.sendPushNotification(adminToken1,
  //       'New Loan Application', "A user has indicated interest in real estate");
  //   await pushNotificationService.sendPushNotification(adminToken2,
  //       'New Loan Application', "A user has indicated interest in real estate");
  // }

  // Future<bool> repeatedReferalCheck() async {
  //   String UserID =
  //       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  //   final result = await OxygenApp.firestore
  //       .collection('ongoingPurchase')
  //       .where('user', isEqualTo: UserID)
  //       .get();

  //   return result.docs.isEmpty;
  // }

  // setImageList() async {
  //   var document = await OxygenApp.firestore
  //       .collection('buildingProjects')
  //       .doc(buildingID)
  //       .get();
  //   image = document["imgList"];
  //   update();
  // }

  // Future<void> getAdminFcmToken() async {
  //   var admin1 = await OxygenApp.firestore
  //       .collection('users')
  //       .doc('slwroSOR1nVG3M6uUHwuy454fBl2')
  //       .get();

  //   var admin2 = await OxygenApp.firestore
  //       .collection('users')
  //       .doc('zWAoct61hbNMw23tjTOPkZLRI6o1')
  //       .get();

  //   adminToken1 = admin1["fcmToken"];
  //   adminToken2 = admin2["fcmToken"];
  // }

  // showModal() {
  //   showModalBottomSheet(
  //     context: GlobalContextService.navigatorKey.currentContext!,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       bool accepted = false;
  //       bool isSaving = false;
  //       return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter mystate) {
  //         return GestureDetector(
  //             onTap: () => Navigator.of(context, rootNavigator: true).pop(),
  //             child: Container(
  //               color: Color.fromRGBO(0, 0, 0, 0.001),
  //               child: GestureDetector(
  //                 onTap: () {},
  //                 child: DraggableScrollableSheet(
  //                   initialChildSize: 0.51,
  //                   minChildSize: 0.2,
  //                   maxChildSize: 0.51,
  //                   builder: (_, controller) {
  //                     return Container(
  //                       padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(5.w),
  //                           topRight: Radius.circular(5.w),
  //                         ),
  //                       ),
  //                       child: isSaving == true
  //                           ? Column(
  //                               children: [
  //                                 SizedBox(height: 4.h),
  //                                 Icon(
  //                                   CupertinoIcons.check_mark_circled,
  //                                   color: oxygenPrimaryColor,
  //                                   size: 12.h,
  //                                 ),
  //                                 Text(
  //                                   "Purchase has been registered, proceed to our office or call our help line for further instructions",
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                       fontSize: 11.sp,
  //                                       fontFamily: "Muli",
  //                                       color: Colors.black),
  //                                 ),
  //                                 SizedBox(height: 4.h),
  //                                 MainButton(
  //                                     title: "Okay",
  //                                     callback: () {
  //                                       Navigator.pop(context);
  //                                     })
  //                               ],
  //                             )
  //                           : Column(
  //                               children: [
  //                                 SizedBox(height: 4.h),
  //                                 Icon(
  //                                   CupertinoIcons.question_diamond,
  //                                   color: oxygenPrimaryColor,
  //                                   size: 12.h,
  //                                 ),
  //                                 Text(
  //                                   "You are about to register your interest in this building after clicking the purchase button, you will need to head over to our office or call our help line for further instructions on how to complete your purhcase",
  //                                   textAlign: TextAlign.center,
  //                                   style: TextStyle(
  //                                       fontSize: 11.sp,
  //                                       fontFamily: "Muli",
  //                                       color: Colors.black),
  //                                 ),
  //                                 SizedBox(height: 4.h),
  //                                 MainButton(
  //                                     title: "Purchase",
  //                                     callback: () {
  //                                       registerPurchase();
  //                                     })
  //                               ],
  //                             ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ));
  //       });
  //     },
  //   );
  // }

  // showModal2(String message) {
  //   showModalBottomSheet(
  //     context: GlobalContextService.navigatorKey.currentContext!,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       bool accepted = false;
  //       return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter mystate) {
  //         return GestureDetector(
  //             onDoubleTap: () =>
  //                 Navigator.of(context, rootNavigator: true).pop(),
  //             child: Container(
  //               color: Color.fromRGBO(0, 0, 0, 0.001),
  //               child: GestureDetector(
  //                 onTap: () {},
  //                 child: DraggableScrollableSheet(
  //                   initialChildSize: 0.4,
  //                   minChildSize: 0.2,
  //                   maxChildSize: 0.40,
  //                   builder: (_, controller) {
  //                     return Container(
  //                       padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
  //                       decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(5.w),
  //                           topRight: Radius.circular(5.w),
  //                         ),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           SizedBox(height: 4.h),
  //                           Icon(
  //                             CupertinoIcons.check_mark_circled,
  //                             color: oxygenPrimaryColor,
  //                             size: 12.h,
  //                           ),
  //                           Text(
  //                             message,
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(
  //                                 fontSize: 11.sp,
  //                                 fontFamily: "Muli",
  //                                 color: Colors.black),
  //                           ),
  //                           SizedBox(height: 4.h),
  //                           MainButton(
  //                               title: "Okay",
  //                               callback: () {
  //                                 Route route = MaterialPageRoute(
  //                                     builder: (_) => MainScreen(
  //                                           sIndex: 2,
  //                                         ));
  //                                 Navigator.pushReplacement(context, route);
  //                               })
  //                         ],
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ));
  //         ;
  //       });
  //     },
  //   );
  // }
}
