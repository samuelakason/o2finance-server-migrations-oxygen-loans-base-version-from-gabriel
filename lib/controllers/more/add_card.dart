import 'dart:convert';
import 'dart:io';

import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/repositories/paystack.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class AddCardController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getKeys();
    //initialisePaystack();
  }

  PaystackRepository paystackRepository = PaystackRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  initialisePaystack() {
    if (publicKey != null) {
      plugin.initialize(publicKey: publicKey!);
    }
  }

  String userId =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  String email =
      OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
  String authCode = "";
  String authLast = "";
  String authBank = "";
  bool keysRetrieved = false;
  String? publicKey;
  final plugin = PaystackPlugin();
  String? skTest;
  String code = "";

  // Future<void> saveAccountDetails() async {
  //   LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
  //   DocumentReference documentReference =
  //       OxygenApp.firestore.collection("AddCard").doc();
  //   print(authLast + '.last......');
  //   documentReference.set({
  //     "authCode": authCode,
  //     "authBank": authBank,
  //     "authLast": authLast,
  //     "email": email,
  //     "userID": userId,
  //     "docId": documentReference.id,
  //     "date": DateTime.now()
  //   }).then((value) {
  //     Navigator.pop(
  //       GlobalContextService.navigatorKey.currentContext!,
  //     );

  //     Fluttertoast.showToast(
  //         msg: " Saved succesfully ",
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   });
  // }

  // Future<void> deleteBank(String AddCardID) async {
  //   OxygenApp.firestore
  //       .collection("AddCard")
  //       .doc(AddCardID)
  //       .delete()
  //       .then((value) {
  //     Fluttertoast.showToast(
  //         msg: " Deleted succesfully ",
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   });
  // }

  // void verifyOnServer(String reference) async {
  //   LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
  //   try {
  //     final response =
  //         await paystackRepository.verifyPayment(reference, skTest);
  //     if (response!.data.status == 'success') {
  //       authCode = response.data.authorization.authorizationCode;
  //       authLast = response.data.authorization.last4;
  //       authBank = response.data.authorization.bank;
  //       saveAccountDetails().then((value) {
  //         Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //         code = "success";
  //         update();
  //       });

  //       print("trully paid");
  //     } else {
  //       Get.snackbar('Error!', response.message,
  //           isDismissible: true,
  //           shouldIconPulse: true,
  //           snackPosition: SnackPosition.TOP,
  //           colorText: Color(0xFF000000),
  //           duration: const Duration(seconds: 5));
  //     }
  //   } catch (e) {
  //     Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
  //     if (e == FetchDataException) {
  //       Get.snackbar('Network Error!',
  //           "Please check your internet connection. A network error has occurred",
  //           isDismissible: true,
  //           shouldIconPulse: true,
  //           snackPosition: SnackPosition.TOP,
  //           colorText: Color(0xFF000000),
  //           duration: const Duration(seconds: 5));
  //     } else {
  //       var errorResult = json.decode(e.toString());
  //       Get.snackbar('Error!', errorResult['message'],
  //           isDismissible: true,
  //           shouldIconPulse: true,
  //           snackPosition: SnackPosition.TOP,
  //           colorText: Color(0xFF000000),
  //           duration: const Duration(seconds: 5));
  //     }
  //   }
  // }

  // String _getReference() {
  //   String platform;
  //   if (Platform.isIOS) {
  //     platform = 'iOS';
  //   } else {
  //     platform = 'Android';
  //   }

  //   return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  // }

  // chargeCard() async {
  //   String userEmail =
  //       OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
  //   Charge charge = Charge()
  //     ..amount = 5000
  //     ..reference = _getReference()
  //     ..email = userEmail;
  //   CheckoutResponse response = await plugin.checkout(
  //     GlobalContextService.navigatorKey.currentContext!,
  //     method: CheckoutMethod.card,
  //     charge: charge,
  //   );
  //   print(response.message);
  //   print(response);
  //   if (response.status == true) {
  //     verifyOnServer(response.reference.toString());
  //   }
  // }

  // getKeys() async {
  //   String sk =
  //       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  //   var loanDetails = await OxygenApp.firestore
  //       .collection('payKeys')
  //       .doc("zXhIRywgVEAauiiy0cVF")
  //       .get();

  //   skTest = loanDetails["skLive"].toString();
  //   publicKey = loanDetails["pkLive"].toString();
  //   if (skTest != null) {
  //     keysRetrieved = true;
  //     initialisePaystack();
  //   }
  // }

  // showModal() {
  //   showModalBottomSheet(
  //     context: GlobalContextService.navigatorKey.currentContext!,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) {
  //       bool accepted = false;
  //       return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter mystate) {
  //         return GestureDetector(
  //             onTap: () => Navigator.of(context, rootNavigator: true).pop(),
  //             child: Container(
  //               color: Color.fromRGBO(0, 0, 0, 0.001),
  //               child: GestureDetector(
  //                 onTap: () {},
  //                 child: DraggableScrollableSheet(
  //                   initialChildSize: 0.5,
  //                   minChildSize: 0.2,
  //                   maxChildSize: 0.5,
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

  // displayDialog() {
  //   showAnimatedDialog(
  //       context: GlobalContextService.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       animationType: DialogTransitionType.slideFromBottom,
  //       curve: Curves.fastOutSlowIn,
  //       duration: Duration(milliseconds: 700),
  //       builder: (c) {
  //         return StatefulBuilder(builder: (context, setState) {
  //           return AlertDialog(
  //             shape: const RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //             content: Container(
  //               height: 33.h,
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     "You'll be charged a one time fee of ₦50 to add your card details, do you want to proceed?",
  //                     style: TextStyle(
  //                       fontSize: 11.sp,
  //                       fontFamily: "Muli",
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   SizedBox(height: 4.h),
  //                   MainButton(
  //                       title: "Yes",
  //                       callback: () {
  //                         Navigator.pop(context);
  //                         chargeCard();
  //                       }),
  //                   SizedBox(height: 2.h),
  //                   MainButton(
  //                       title: "Cancel",
  //                       callback: () {
  //                         Navigator.pop(context);
  //                       })
  //                 ],
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }

  // displayDialog2(String cardID) {
  //   showAnimatedDialog(
  //       context: GlobalContextService.navigatorKey.currentContext!,
  //       barrierDismissible: true,
  //       animationType: DialogTransitionType.slideFromBottom,
  //       curve: Curves.fastOutSlowIn,
  //       duration: Duration(milliseconds: 700),
  //       builder: (c) {
  //         return StatefulBuilder(builder: (context, setState) {
  //           return AlertDialog(
  //             shape: const RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //             content: Container(
  //               height: 33.h,
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     "Are you sure you want to delete this card?",
  //                     style: TextStyle(
  //                       fontSize: 11.sp,
  //                       fontFamily: "Muli",
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   SizedBox(height: 4.h),
  //                   MainButton(
  //                       title: "Yes",
  //                       callback: () {
  //                         Navigator.pop(context);
  //                         deleteBank(cardID);
  //                       }),
  //                   SizedBox(height: 2.h),
  //                   MainButton(
  //                       title: "Cancel",
  //                       callback: () {
  //                         Navigator.pop(context);
  //                       })
  //                 ],
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
}
