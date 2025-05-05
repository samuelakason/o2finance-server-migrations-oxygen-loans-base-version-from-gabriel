// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:oxygen_loans/config/oxygen.dart';

// class AgentsController extends GetxController {
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getUserDetails();
//   }

//   String userId =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   bool? isCompleteProfile =
//       OxygenApp.sharedPreferences!.getBool(OxygenApp.isCompleteProfile);
//   String isLoanActive = "1";
//   bool isAgent = false;
//   bool isProfileFound = false;
//   TabController? tabController;

//   getUserDetails() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();

//     isLoanActive = loanDetails["isLoanActive"].toString();
//     isAgent = loanDetails["isAgent"];
//     isProfileFound = true;
//     update();
//   }
// }
