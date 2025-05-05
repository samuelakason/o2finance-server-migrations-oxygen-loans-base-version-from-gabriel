// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class InvesteDetails2 extends StatefulWidget {
//   const InvesteDetails2({Key? key, required this.invesetID}) : super(key: key);
//   final String invesetID;

//   @override
//   _InvesteDetails2State createState() => _InvesteDetails2State();
// }

// class _InvesteDetails2State extends State<InvesteDetails2> {
//   String principal = "";
//   String interest = "";
//   String mDate = "";
//   String iRate = "";

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getInvestmentDetails();
//     print("............." + widget.invesetID);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("Portfolio"),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               principal == ""
//                   ? emptyDashBox()
//                   : dashBox("Principal", principal),
//               principal == "" ? emptyDashBox() : dashBox("Interest", interest)
//             ],
//           ),
//           SizedBox(height: 2.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               principal == ""
//                   ? emptyDashBox()
//                   : dashBox("Maturity date", mDate),
//               principal == "" ? emptyDashBox() : dashBox("Interest rate", iRate)
//             ],
//           ),
//           SizedBox(height: 3.h),
//           InkWell(
//             onTap: () {
//               showModal();
//             },
//             child: Container(
//               height: 8.h,
//               margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(4.w),
//                   color: oxygenPrimaryColor),
//               child: Center(
//                 child: Text(
//                   "Withdraw Funds",
//                   style: TextStyle(fontSize: 12.sp, color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             "Note: if you choose to withdraw funds before maturity date, a service charge of 2% will be deducted",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget dashBox(String title, String text) {
//     return Container(
//       height: 43.w,
//       width: 43.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5.w),
//         color: Colors.white,
//         boxShadow: [
//           new BoxShadow(
//             color: Colors.grey,
//             blurRadius: 5.0,
//           ),
//         ],
//       ),
//       child: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 5.h),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
//             ),
//             SizedBox(height: 2.h),
//             Text(
//               text,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 18.sp, fontFamily: "Muli", color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget emptyDashBox() {
//     return Container(
//       height: 43.w,
//       width: 43.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5.w),
//         color: Colors.white,
//         boxShadow: [
//           new BoxShadow(
//             color: Colors.grey,
//             blurRadius: 5.0,
//           ),
//         ],
//       ),
//       child: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 4.h),
//             // CircularProgressIndicator(),
//             SpinKitDoubleBounce(color: oxygenPrimaryColor, size: 15.h),
//           ],
//         ),
//       ),
//     );
//   }

//   showModal() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         bool done = false;
//         bool isLoading = false;
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
//                         child: done == false
//                             ? Column(
//                                 children: [
//                                   SizedBox(height: 2.h),
//                                   Text(
//                                     "Confirmation",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.black),
//                                   ),
//                                   SizedBox(height: 1.h),
//                                   Text(
//                                     "Are you sure you want to cancel this investement and withdraw funds to wallet?",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontSize: 11.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.black),
//                                   ),
//                                   SizedBox(height: 2.h),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(2.w),
//                                         border: Border.all(
//                                             color: oxygenPrimaryColor)),
//                                     height: 8.h,
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             "Yes",
//                                             style: TextStyle(fontSize: 16),
//                                           ),
//                                           Visibility(
//                                             visible: isLoading,
//                                             child: SpinKitDoubleBounce(
//                                                 color: oxygenPrimaryColor,
//                                                 size: 15.h),
//                                           ),
//                                         ],
//                                       ),
//                                       onPressed: () async {
//                                         mystate(() {
//                                           isLoading = true;
//                                         });
//                                         withdrawToWallet().then((value) {
//                                           mystate(() {
//                                             done = true;
//                                           });
//                                         });
//                                       },
//                                       color: Colors.white,
//                                       textColor: oxygenPrimaryColor,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(2.w),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(height: 2.h),
//                                   Container(
//                                     height: 8.h,
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text(
//                                         "Cancel",
//                                         style: TextStyle(fontSize: 16),
//                                       ),
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       color: Color(0xFF1AB6DC),
//                                       textColor: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(2.w),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             : Column(
//                                 children: [
//                                   SizedBox(height: 4.h),
//                                   Icon(
//                                     CupertinoIcons.check_mark_circled,
//                                     color: oxygenPrimaryColor,
//                                     size: 12.h,
//                                   ),
//                                   Text(
//                                     "Withdrawal succesful  ",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontSize: 11.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.black),
//                                   ),
//                                   SizedBox(height: 4.h),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(2.w),
//                                         border: Border.all(
//                                             color: oxygenPrimaryColor)),
//                                     height: 8.h,
//                                     width: double.infinity,
//                                     child: FlatButton(
//                                       child: Text(
//                                         "Okay",
//                                         style: TextStyle(fontSize: 16),
//                                       ),
//                                       onPressed: () {
//                                         Route route = MaterialPageRoute(
//                                             builder: (_) =>
//                                                 MainScreen(sIndex: 0));
//                                         Navigator.pushReplacement(
//                                             context, route);
//                                       },
//                                       color: Colors.white,
//                                       textColor: oxygenPrimaryColor,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(2.w),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                       );
//                     },
//                   ),
//                 ),
//               ));
//           ;
//         });
//       },
//     );
//   }

//   getInvestmentDetails() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails = await OxygenApp.firestore
//         .collection('users')
//         .doc(userID)
//         .collection("investements")
//         .doc(widget.invesetID)
//         .get();

//     setState(() {
//       principal = loanDetails["principal"].toString();
//       interest = loanDetails["interest"].toString();
//       mDate = OxygenApp.timeFormat2
//           .format(DateTime.parse(loanDetails["maturitDate"].toString()));
//       iRate = loanDetails["interesetRate"].toString();
//     });
//   }

//   Future<void> withdrawToWallet() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();

//     double pInvestBalance = double.parse(loanDetails["investment"].toString());

//     double pWalletBalance = double.parse(loanDetails["loan"].toString());
//     double _principal = double.parse(principal.toString());
//     double _interest = double.parse(interest.toString());
//     double tSum = pWalletBalance + _principal + _interest;
//     double debited = tSum - ((2 / 100) * tSum);
//     OxygenApp.firestore
//         .collection("users")
//         .doc(userID)
//         .collection("investements")
//         .doc(widget.invesetID)
//         .update({
//       "status": "1",
//     });
//     OxygenApp.firestore
//         .collection("users")
//         .doc(userID)
//         .update({"loan": debited, "investment": pInvestBalance - _principal});
//   }
// }
