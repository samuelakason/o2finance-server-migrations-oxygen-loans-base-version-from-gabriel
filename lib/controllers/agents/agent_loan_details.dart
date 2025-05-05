// import 'dart:convert';
// import 'dart:io';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/http_client.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:http/http.dart' as http;
// import 'package:oxygen_loans/repositories/paystack.dart';
// import 'package:oxygen_loans/screens/loans/widgets/card_option.dart';
// import 'package:oxygen_loans/screens/loans/widgets/card_stream.dart';
// import 'package:oxygen_loans/screens/loans/widgets/repayment_perecent.dart';
// import 'package:oxygen_loans/screens/loans/widgets/succes_sheet.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/card_option.dart';
// import 'package:oxygen_loans/screens/more/agent/widgets/repayment_perecent.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/services/app_exceptions.dart';
// import 'package:oxygen_loans/services/global_context.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class AgentLoanDetailsController extends GetxController {
//   AnimationController? animationController;
//   Animation<Offset>? animation;
//   String loanAMount = "";

//   String? publicKey;
//   // var publicKey = 'pk_test_d97e2d4ea9a37ad152ee608ddf01b5c93f9e4470';
//   final plugin = PaystackPlugin();
//   String? skTest;
//   bool keysRetrieved = false;
//   String code = "";
//   int? endTime;
//   int totalRepay = 0;
//   bool isPayingSplit = false;
//   bool isPayingFull = false;
//   bool splittable = false;
//   String percentagePay = "";
//   bool isThritypaid = false;
//   bool isthirtyOnePaid = false;
//   bool isForyPaid = false;
//   List payRecord = [];
//   bool isLoading = true;
//   bool isAfterDueDate = false;
//   int addedDefault = 0;
//   bool alreadyPayingSPlit = false;
//   String userId =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   String userName =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   String authCode = "";
//   bool newCard = true;
//   String loanID = '';
//   String status = '';
//   String matDate = '';
//   PaystackRepository paystackRepository = PaystackRepository(
//     userToken: AppHttpClient.getCurentToken(),
//     client: AppHttpClient.getHttpClient(),
//   );
//   String interestAmount = '';
//   Timestamp? calPeriod;
//   bool isDeclined = true;
//   bool splitpayment = false;
//   int loanPeriod = 0;
//   int interestRate = 0;
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//   }

//   getStarted() async {
//     await getDetails();
//     getKeys();
//     calculateRepay();
//     endTime =
//         DateTime.parse(calPeriod!.toDate().toString()).millisecondsSinceEpoch;
//     //.second;

//     initialisePaystack();
//   }

//   @override
//   void onClose() {
//     // TODO: implement onClose
//     super.onClose();
//     @override
//     dispose() {
//       animationController!.dispose(); // you need this
//       super.dispose();
//     }
//   }

//   initialisePaystack() {
//     if (publicKey != null) {
//       plugin.initialize(publicKey: publicKey!);
//     }
//   }

//   Future<void> chargeAuth() async {
//     LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
//     String userEmail =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
//     print(userEmail + '........');
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }
//     String chargeReference =
//         "ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}";
//     print(chargeReference);
//     try {
//       print("charging auth");
//       final response = await paystackRepository.authCharge(
//           authCode, userEmail, totalRepay.toString(), chargeReference, skTest);
//       final response2 =
//           await paystackRepository.verifyAuthPayment(chargeReference, skTest);
//       if (response2!.data.status == 'success') {
//         print("confimed trully");
//         updateDatabase().then((value) {
//           Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//           code = "success";
//           showModal("You loan has been paid");
//           update();
//         });
//         print("trully paid");
//       } else {
//         Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//         Get.snackbar('Error!', response2.data.gatewayResponse,
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       }
//     } catch (e) {
//       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//       if (e == FetchDataException) {
//         Get.snackbar('Network Error!',
//             "Please check your internet connection. A network error has occurred",
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       } else {
//         print(e);
//         var errorResult = json.decode(e.toString());
//         Get.snackbar('Error!', errorResult['message'],
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       }
//     }
//   }

//   void verifyOnServer(String reference) async {
//     LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
//     try {
//       final response =
//           await paystackRepository.verifyPayment(reference, skTest);
//       if (response!.data.status == 'success') {
//         print("trully paid");
//         updateDatabase().then((value) {
//           Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//           code = "success";
//           showModal("You loan has been paid");
//           update();
//           //inform admin if loan  repayment
//           OxygenApp.firestore.collection("adminNotifications").doc().set({
//             "text": "$userName has paid back a loan for a loan",
//             "time": DateTime.now()
//                 .add(Duration(days: 0, hours: 0, minutes: 0))
//                 .toString(),
//           });
//           OxygenApp.firestore
//               .collection("users")
//               .doc("slwroSOR1nVG3M6uUHwuy454fBl2")
//               .update({
//             "unViewed": true,
//           });
//           OxygenApp.firestore
//               .collection("users")
//               .doc("zWAoct61hbNMw23tjTOPkZLRI6o1")
//               .update({
//             "unViewed": true,
//           });
//         });
//       } else {
//         Get.snackbar('Error!', response.message,
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       }
//     } catch (e) {
//       Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
//       if (e == FetchDataException) {
//         Get.snackbar('Network Error!',
//             "Please check your internet connection. A network error has occurred",
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,

//             // backgroundColor: Color(0xFFb6abe5),
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       } else {
//         var errorResult = json.decode(e.toString());

//         Get.snackbar('Error!', errorResult['message'],
//             isDismissible: true,
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP,
//             colorText: Color(0xFF000000),
//             duration: const Duration(seconds: 5));
//       }
//     }
//   }

//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }

//     return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
//   }

//   chargeCard() async {
//     String userEmail =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
//     Charge charge = Charge()
//       ..amount = totalRepay
//       ..reference = _getReference()
//       ..email = userEmail;
//     CheckoutResponse response = await plugin.checkout(
//       GlobalContextService.navigatorKey.currentContext!,
//       method: CheckoutMethod.card,
//       charge: charge,
//     );
//     if (response.status == true) {
//       verifyOnServer(response.reference.toString());
//     }
//   }

//   Future<void> calculateRepay() async {
//     DateTime dueDate = DateTime.parse(matDate.toString());
//     if (DateTime.now().isAfter(dueDate)) {
//       int differenceInDays = DateTime.now().difference(dueDate).inMinutes;
//       isAfterDueDate = true;
//       int loaned = int.parse(loanAMount.toString());
//       int interestToPay = int.parse(interestAmount.toString());
//       int maxAdd = ((15 / 100) * loaned).round();
//       double dailyInterest = interestRate / loanPeriod;
//       double addedInterest = dailyInterest * differenceInDays;

//       int addedValue = ((addedInterest / 100) * loaned).round();
//       addedDefault = addedValue;
//       if (addedValue > maxAdd) {
//         totalRepay = (loaned + interestToPay + maxAdd) * 100;
//       } else {
//         totalRepay = (loaned + interestToPay + addedValue) * 100;
//       }
//     } else {
//       int loaned = int.parse(loanAMount);
//       int interest = int.parse(interestAmount);
//       totalRepay = (loaned + interest) * 100;
//       //chargeCard();
//     }
//   }

//   Future<void> getDetails() async {
//     var loanDetails =
//         await OxygenApp.firestore.collection('agentLoans').doc(loanID).get();

//     loanAMount = loanDetails["amount"];
//     loanID = loanDetails["loanID"];
//     payRecord = loanDetails["paymentRecord"];
//     splittable = loanDetails["splitPayment"];
//     alreadyPayingSPlit = loanDetails["alreadyPayingSPlit"];
//     isLoading = false;
//     update();
//   }

//   Future<void> updateDatabase() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();

//     String userName =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userName).toString();
//     var referDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();

//     String referrerID = referDetails["referrerID"];

//     // pay referrer
//     if (referrerID != "") {
//       await OxygenApp.firestore
//           .collection("users")
//           .doc(referrerID)
//           .collection("ReferredFriends")
//           .get()
//           .then((querySnapshot) {
//         querySnapshot.docs.forEach((result) {
//           querySnapshot.docs.asMap().forEach((index, data) async {
//             if (querySnapshot.docs[index]["friendID"] == userID &&
//                 querySnapshot.docs[index]["paid"] == false) {
//               var referWalletDetails = await OxygenApp.firestore
//                   .collection('users')
//                   .doc(referrerID)
//                   .get();
//               double pWalletBalance =
//                   double.parse(referWalletDetails["loan"].toString());

//               OxygenApp.firestore.collection("users").doc(referrerID).update({
//                 "loan": pWalletBalance + 500,
//               }).then((value) {});

//               OxygenApp.firestore
//                   .collection("users")
//                   .doc(referrerID)
//                   .collection("ReferredFriends")
//                   .doc(result.id)
//                   .update({
//                 "paid": true,
//               }).then((value) {});

//               OxygenApp.firestore
//                   .collection("users")
//                   .doc(referrerID)
//                   .collection("notifications")
//                   .doc()
//                   .set({
//                 "text":
//                     "Referral bonus of ₦500 from user $userName has been paid",
//                 "time": DateTime.now()
//                     .add(Duration(days: 0, hours: 0, minutes: 0))
//                     .toString(),
//               }).then((value) {});
//             }
//           });
//         });
//       });
//     }
//     if (isPayingFull) {
//       var userDetails =
//           await OxygenApp.firestore.collection('users').doc(userID).get();

//       int oldmaxLoan = userDetails["maxLoan"];

//       int pMaxloan = int.parse(loanAMount);
//       double nMaxloan = (60 / 100) * pMaxloan;
//       int newMaxLoan = nMaxloan.round();
//       int saveMaxLoan = oldmaxLoan;
//       int summed = newMaxLoan + oldmaxLoan;
//       int eighty = ((80 / 100) * oldmaxLoan).round();
//       bool isAfter = true;
//       if (DateTime.parse(matDate).isAfter(DateTime.now())) {
//         print("Not after");
//         isAfter = false;
//         if (summed >= 500000) {
//           saveMaxLoan = 500000;
//         } else {
//           if (pMaxloan == oldmaxLoan || pMaxloan >= eighty) {
//             saveMaxLoan = newMaxLoan + oldmaxLoan;
//           } else {
//             saveMaxLoan = oldmaxLoan;
//           }
//         }
//       } else {
//         print("expire");
//         saveMaxLoan = oldmaxLoan;
//       }

//       OxygenApp.firestore.collection("users").doc(userID).update({
//         "isLoanActive": "0",
//         "maxLoan": saveMaxLoan,
//         "firstLoanTaken": true,
//       }).then((value) async {
//         await OxygenApp.sharedPreferences!
//             .setBool(OxygenApp.firstLoanTaken, true);
//       });

//       OxygenApp.firestore.collection("agentLoans").doc(loanID).update({
//         "status": "2",
//         "paidOnTime": isAfter == false ? true : false,
//       }).then((value) {});

//       OxygenApp.firestore
//           .collection("users")
//           .doc(userID)
//           .collection("notifications")
//           .doc()
//           .set({
//         "text": "Your loan of ₦$loanAMount has been repaid",
//         "time": DateTime.now()
//             .add(Duration(days: 0, hours: 0, minutes: 0))
//             .toString(),
//       }).then((value) {
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "unViewed": true,
//         }).then((value) {});
//       });
//     } else {
//       if (payRecord.length == 2) {
//         //loan status
//         OxygenApp.firestore.collection("agentLoans").doc(loanID).update({
//           "status": "2",
//           "paymentRecord": FieldValue.arrayUnion([percentagePay]),
//         }).then((value) {});

//         //user
//         OxygenApp.firestore.collection("agentLoans").doc(userID).update({
//           "isLoanActive": "0",
//           "firstLoanTaken": true,
//         }).then((value) async {
//           await OxygenApp.sharedPreferences!
//               .setBool(OxygenApp.firstLoanTaken, true);
//         });

//         //notification
//         OxygenApp.firestore
//             .collection("users")
//             .doc(userID)
//             .collection("notifications")
//             .doc()
//             .set({
//           "text": "Your loan of ₦$loanAMount has been fully repaid",
//           "time": DateTime.now()
//               .add(Duration(days: 0, hours: 0, minutes: 0))
//               .toString(),
//         }).then((value) {
//           OxygenApp.firestore.collection("users").doc(userID).update({
//             "unViewed": true,
//           }).then((value) {});
//         });
//       } else {
//         OxygenApp.firestore.collection("agentLoans").doc(loanID).update({
//           "alreadyPayingSPlit": true,
//           "paymentRecord": FieldValue.arrayUnion([percentagePay]),
//         }).then((value) {});

//         OxygenApp.firestore
//             .collection("users")
//             .doc(userID)
//             .collection("notifications")
//             .doc()
//             .set({
//           "text": "₦$totalRepay has been repaid from your loan",
//           "time": DateTime.now()
//               .add(Duration(days: 0, hours: 0, minutes: 0))
//               .toString(),
//         }).then((value) {
//           OxygenApp.firestore.collection("users").doc(userID).update({
//             "unViewed": true,
//           }).then((value) {});
//         });
//       }
//     }
//   }

//   getKeys() async {
//     String sk =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails = await OxygenApp.firestore
//         .collection('payKeys')
//         .doc("zXhIRywgVEAauiiy0cVF")
//         .get();

//     skTest = loanDetails["skLive"].toString();
//     publicKey = loanDetails["pkLive"].toString();
//     if (skTest != null) {
//       keysRetrieved = true;
//       initialisePaystack();
//     }
//     print(skTest);
//     update();
//   }

//   showModal(String message) {
//     showModalBottomSheet(
//         context: GlobalContextService.navigatorKey.currentContext!,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (context) {
//           bool accepted = false;
//           return SuccesSheet();
//         });
//   }

//   showModal2() {
//     showModalBottomSheet(
//       context: GlobalContextService.navigatorKey.currentContext!,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         bool accepted = false;
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter mystate) {
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
//                       return AgentRepaymentPerecent();
//                     },
//                   ),
//                 ),
//               ));
//         });
//       },
//     );
//   }

//   showModal3() {
//     showModalBottomSheet(
//       context: GlobalContextService.navigatorKey.currentContext!,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         bool accepted = false;
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter mystate) {
//           return GestureDetector(
//               onTap: () => Navigator.of(context, rootNavigator: true).pop(),
//               child: Container(
//                 color: const Color.fromRGBO(0, 0, 0, 0.001),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: DraggableScrollableSheet(
//                     initialChildSize: 0.44,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.44,
//                     builder: (_, controller) {
//                       return AgentCardOption();
//                     },
//                   ),
//                 ),
//               ));
//         });
//       },
//     );
//   }

//   showModal4() {
//     showModalBottomSheet(
//       context: GlobalContextService.navigatorKey.currentContext!,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return StatefulBuilder(
//             builder: (BuildContext context, StateSetter mystate) {
//           return GestureDetector(
//               onTap: () => Navigator.of(context, rootNavigator: true).pop(),
//               child: Container(
//                 color: Color.fromRGBO(0, 0, 0, 0.001),
//                 child: GestureDetector(
//                   onTap: () {},
//                   child: DraggableScrollableSheet(
//                     initialChildSize: 0.6,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.60,
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
//                           children: [SizedBox(height: 4.h), CardStream()],
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
// }
