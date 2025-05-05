// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/loans/loan_repayment_confirmation.dart';
// import 'package:oxygen_loans/screens/more/agent/agent_loan_repayment.dart';
// import 'package:oxygen_loans/services/global_context.dart';

// class AgentGetLoanController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     calculateCurrentLoan();
//   }

//   final TextEditingController bvnTextEditingController =
//       TextEditingController(text: "");
//   final TextEditingController accountNumberTextEditingController =
//       TextEditingController();
//   final TextEditingController loanAmountTextEditingController =
//       TextEditingController();
//   DateTime endDate = DateTime.now().add(Duration(days: 7));
//   List<String> banks = [
//     "Please select",
//     "GTB",
//     "First bank",
//     "UBA",
//     "FCMB",
//     "Access Bank",
//     "Union Bank",
//   ];
//   String currentBank = "Please select";

//   List<String> loanReason = [
//     "Please select",
//     "Utility bills, airtime and cable subsription",
//     "House hold needs and requirements",
//     "Purchase of food items",
//     "Payment of fees",
//     "Other reasons",
//   ];
//   String currentloanReason = "Please select";
//   int maxLoan = 5000;
//   bool isCalculated = false;
//   String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);

//   calculateCurrentLoan() async {
//     bool? firstLoanTaken =
//         OxygenApp.sharedPreferences!.getBool(OxygenApp.firstLoanTaken);

//     if (firstLoanTaken == false) {
//       String? employmentStatus =
//           OxygenApp.sharedPreferences!.getString(OxygenApp.emplymentStatus);

//       if (employmentStatus == "Student" || employmentStatus == "Unemployed") {
//         maxLoan = 3000;
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "maxLoan": 3000,
//         }).then((value) {
//           isCalculated = true;
//           update();
//         });
//       }

//       if (employmentStatus == "Self employed" ||
//           employmentStatus == "Employee" ||
//           employmentStatus == "Employer") {
//         maxLoan = 5000;
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "maxLoan": 5000,
//         }).then((value) {
//           isCalculated = true;
//           update();
//         });
//       }
//     } else {
//       var userDetails =
//           await OxygenApp.firestore.collection('users').doc(userID).get();

//       int oldmaxLoan = userDetails["maxLoan"];

//       maxLoan = oldmaxLoan;
//       isCalculated = true;
//       update();
//     }
//   }

//   Future<void> saveToprefs() async {
//     await OxygenApp.sharedPreferences!.setString(
//         OxygenApp.loanAmount, loanAmountTextEditingController.text.trim());
//     await OxygenApp.sharedPreferences!
//         .setString(OxygenApp.loanReason, currentloanReason.trim());
//   }

//   navigateToNext() {
//     saveToprefs().then((value) {
//       Route route =
//           MaterialPageRoute(builder: (_) => AgentLoanRepaymentConfirmation());
//       Navigator.push(GlobalContextService.navigatorKey.currentContext!, route);
//     });
//   }
// }
