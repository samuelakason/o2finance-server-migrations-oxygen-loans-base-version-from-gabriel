// // ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

// import 'dart:convert';
// import 'dart:io';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';
// import 'package:http/http.dart' as http;

// class ShopHistory2 extends StatefulWidget {
//   ShopHistory2(
//       {Key? key,
//       required this.loanID,
//       required this.status,
//       required this.matDate,
//       required this.loanAmount,
//       required this.interestAmount,
//       required this.splitpayment,
//       required this.loanPeriod,
//       required this.interestRate,
//       required this.calPeriod})
//       : super(key: key);
//   final String loanID;
//   final String status;
//   final String matDate;
//   final String loanAmount;
//   final String interestAmount;
//   final bool splitpayment;
//   final int loanPeriod;
//   final int interestRate;
//   final Timestamp calPeriod;

//   @override
//   _ShopHistory2State createState() => _ShopHistory2State();
// }

// class _ShopHistory2State extends State<ShopHistory2>
//     with TickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation<Offset>? _animation;
//   String loanAMount = "";
//   String loanID = "";
//   String shoppingCode = "";
//   String? publicKey;
//   final plugin = PaystackPlugin();
//   String? skTest;
//   String code = "";
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
//   bool payingSPlitActive = false;
//   bool isAfterDueDate = false;
//   int addedDefault = 0;
//   bool alreadyPayingSPlit = false;
//   bool newCard = true;
//   int? endTime;
//   String userId =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   String userEmail =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
//   String authCode = "";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(widget.status);
//     getDetails();
//     getKeys();
//     calculateRepay();
//     endTime = DateTime.parse(widget.calPeriod.toDate().toString())
//         .millisecondsSinceEpoch;
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1500),
//       vsync: this,
//     )..repeat(reverse: true);

//     _animation = Tween<Offset>(
//       begin: Offset(0, 0.1),
//       end: Offset(0, 0),
//     ).animate(CurvedAnimation(
//       parent: _controller!,
//       curve: Curves.bounceIn,
//     ));
//   }

//   initialisePaystack() {
//     if (publicKey != null) {
//       plugin.initialize(publicKey: publicKey!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("Loan details"),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     if (widget.status == "0") {
//       return pendingBox();
//     } else if (widget.status == "1") {
//       return approvedBox();
//     } else if (widget.status == "2") {
//       return completedBox();
//     } else if (widget.status == "3") {
//       return declinedBox();
//     } else {
//       return Container();
//     }
//   }

//   Widget pendingBox() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: SlideTransition(
//               position: _animation!,
//               transformHitTests: true,
//               textDirection: TextDirection.ltr,
//               child: Container(
//                 height: 25.h,
//                 width: 25.h,
//                 padding: EdgeInsets.all(5.w),
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle, color: oxygenPrimaryColor),
//                 child: Center(
//                   child: CountdownTimer(
//                     textStyle: TextStyle(
//                       fontSize: 15.sp,
//                       fontFamily: "Muli",
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     endTime: endTime,
//                     endWidget: Text(
//                       "00:00:00",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         fontFamily: "Muli",
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           Text(
//             "Please wait.... Your loan will be approved soon",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF093D49),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan amount", loanAMount),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan ID", loanID),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox(
//                   "Due date",
//                   OxygenApp.timeFormat2.format(DateTime.parse(widget.matDate)),
//                 ),
//           SizedBox(height: 2.h),
//         ],
//       ),
//     );
//   }

//   Widget approvedBox() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "This loan is due on " +
//                 OxygenApp.timeFormat2.format(DateTime.parse(widget.matDate)) +
//                 ", you can pay back right now by clicking on the button below ",
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF093D49),
//             ),
//           ),
//           SizedBox(height: 3.h),
//           Text(
//             "Loan amount ",
//             style: TextStyle(
//               fontSize: 12,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF808080),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : Text(
//                   loanAMount,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//           SizedBox(height: 2.h),
//           Divider(color: Colors.grey),
//           Text(
//             "Loan ID",
//             style: TextStyle(
//               fontSize: 12,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF808080),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanID == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : Text(
//                   loanID,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//           SizedBox(height: 2.h),
//           Divider(color: Colors.grey),
//           Text(
//             "Expiration date",
//             style: TextStyle(
//               fontSize: 12,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF808080),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanID == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : Text(
//                   OxygenApp.timeFormat2.format(DateTime.parse(widget.matDate)),
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w400,
//                     color: Colors.black,
//                   ),
//                 ),
//           SizedBox(height: 2.h),
//           Text(
//             "Shopping code",
//             style: TextStyle(
//               fontSize: 12,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF808080),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanID == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       shoppingCode,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontFamily: "Muli",
//                         fontWeight: FontWeight.w400,
//                         color: Colors.black,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Clipboard.setData(ClipboardData(text: shoppingCode))
//                             .then((value) {
//                           Fluttertoast.showToast(
//                               msg: "Shopping code copied",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: oxygenPrimaryColor,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         });
//                       },
//                       child: SvgPicture.asset(
//                         "assets/icons/copy.svg",
//                         width: 5.w,
//                         height: 5.w,
//                         color: oxygenPrimaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//           SizedBox(height: 2.h),
//           Divider(color: Colors.grey),
//           SizedBox(height: 4.h),
//           Visibility(
//             visible: payingSPlitActive == false,
//             child: Container(
//                 height: 7.h,
//                 margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
//                 width: 100.w,
//                 child: MainButton(
//                     title: "Pay back",
//                     callback: () {
//                       if (skTest != null) {
//                         isPayingFull = true;
//                         isPayingSplit = false;
//                         showModal3();
//                       } else {
//                         getKeys();
//                         AwesomeDialog(
//                           context: context,
//                           animType: AnimType.RIGHSLIDE,
//                           headerAnimationLoop: true,
//                           dialogType: DialogType.ERROR,
//                           body: Center(
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                     height: SizerUtil.deviceType ==
//                                             DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     "Please check your internet connection and try again",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 10.sp,
//                                       fontFamily: "Muli",
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                     height: SizerUtil.deviceType ==
//                                             DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h)
//                               ],
//                             ),
//                           ),
//                           buttonsTextStyle: TextStyle(
//                             fontSize: 10.sp,
//                             fontFamily: "Muli",
//                           ),
//                           desc: 'Your response has been saved',
//                           btnOkIcon: Icons.cancel,
//                           btnOkColor: Colors.red,
//                           btnOkOnPress: () {},
//                         )..show();
//                       }
//                     })),
//           ),
//           Visibility(
//             visible: splittable,
//             child: widget.splitpayment
//                 ? InkWell(
//                     onTap: () {
//                       if (skTest != null) {
//                         isPayingSplit = true;
//                         isPayingFull = false;
//                         showModal3();
//                       } else {
//                         getKeys();
//                         AwesomeDialog(
//                           context: context,
//                           animType: AnimType.RIGHSLIDE,
//                           headerAnimationLoop: true,
//                           dialogType: DialogType.ERROR,
//                           body: Center(
//                             child: Column(
//                               children: [
//                                 SizedBox(
//                                     height: SizerUtil.deviceType ==
//                                             DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     "Please check your internet connection and try again",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                       fontSize: 10.sp,
//                                       fontFamily: "Muli",
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                     height: SizerUtil.deviceType ==
//                                             DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h)
//                               ],
//                             ),
//                           ),
//                           buttonsTextStyle: TextStyle(
//                             fontSize: 10.sp,
//                             fontFamily: "Muli",
//                           ),
//                           desc: 'Your response has been saved',
//                           btnOkIcon: Icons.cancel,
//                           btnOkColor: Colors.red,
//                           btnOkOnPress: () {},
//                         )..show();
//                       }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: oxygenPrimaryColor),
//                           borderRadius: BorderRadius.circular(3.w),
//                           color: Colors.white),
//                       height: 7.h,
//                       padding: EdgeInsets.all(3.w),
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
//                       width: 100.w,
//                       child: Center(
//                         child: Text(
//                           "Pay in installments ",
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontFamily: "Muli",
//                             fontWeight: FontWeight.w400,
//                             color: oxygenPrimaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget completedBox() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 2.h),
//           Text(
//             "This loan has been succesfully repaid",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF093D49),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan amount", loanAMount),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan ID", loanID),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox(
//                   "Due date",
//                   OxygenApp.timeFormat2.format(DateTime.parse(widget.matDate)),
//                 ),
//           SizedBox(height: 2.h),
//         ],
//       ),
//     );
//   }

//   Widget declinedBox() {
//     return Container(
//       padding: EdgeInsets.all(4.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "This loan has been declined",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: "Muli",
//               fontWeight: FontWeight.w400,
//               color: Color(0xFF093D49),
//             ),
//           ),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan amount", loanAMount),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox("Loan ID", loanID),
//           SizedBox(height: 2.h),
//           loanAMount == ""
//               ? Align(
//                   alignment: Alignment.bottomLeft,
//                   child: CircularProgressIndicator())
//               : reviewDetailBox(
//                   "Due date",
//                   OxygenApp.timeFormat2.format(DateTime.parse(widget.matDate)),
//                 ),
//           SizedBox(height: 2.h),
//         ],
//       ),
//     );
//   }

//   showModal(String message) {
//     showModalBottomSheet(
//       context: context,
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
//                               code == "success"
//                                   ? CupertinoIcons.check_mark_circled
//                                   : CupertinoIcons.xmark_circle,
//                               color: code == "success"
//                                   ? oxygenPrimaryColor
//                                   : Colors.red,
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
//                                 title: code == "success" ? "Okay" : "Cancel",
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
//           ;
//         });
//       },
//     );
//   }

//   showModal2() {
//     showModalBottomSheet(
//       context: context,
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
//                     initialChildSize: 0.3,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.30,
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
//                         child: isLoading
//                             ? SpinKitDoubleBounce(
//                                 color: oxygenPrimaryColor, size: 15.h)
//                             : Column(
//                                 children: [
//                                   SizedBox(height: 4.h),
//                                   Text(
//                                     "Select your desired repayment percentage",
//                                     style: TextStyle(
//                                         fontSize: 11.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.black),
//                                   ),
//                                   SizedBox(height: 2.h),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Visibility(
//                                         visible: !payRecord.contains("30"),
//                                         child: InkWell(
//                                           onTap: () async {
//                                             percentagePay = "30";
//                                             int loaned = int.parse(
//                                                 widget.loanAmount.toString());
//                                             int interestToPay = int.parse(widget
//                                                 .interestAmount
//                                                 .toString());
//                                             int totalRepayFirst = (loaned +
//                                                     interestToPay +
//                                                     addedDefault) *
//                                                 100;
//                                             totalRepay =
//                                                 ((30 / 100) * totalRepayFirst)
//                                                     .round();

//                                             mystate(() {
//                                               isLoading = false;
//                                             });
//                                             chargeCard();
//                                           },
//                                           child: Container(
//                                             height: 15.h,
//                                             width: 30.w,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: oxygenPrimaryColor,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color: Color(0xFFBDBDBD),
//                                                     blurRadius: 5.0,
//                                                     offset: Offset(0.0, 0.75)),
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "30%",
//                                                 style: TextStyle(
//                                                     fontSize: 15.sp,
//                                                     fontFamily: "Muli",
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Visibility(
//                                         visible: !payRecord.contains("31"),
//                                         child: InkWell(
//                                           onTap: () {
//                                             /*
//                                             int loaned = int.parse(
//                                                 widget.loanAmount.toString());
//                                             int interestToPay = int.parse(widget
//                                                 .interestAmount
//                                                 .toString());
//                                             int totalRepayFirst =
//                                                 (loaned + interestToPay) * 100;
//                                             */
//                                             percentagePay = "31";

//                                             int loaned = int.parse(
//                                                 widget.loanAmount.toString());
//                                             int interestToPay = int.parse(widget
//                                                 .interestAmount
//                                                 .toString());

//                                             int totalRepayFirst = (loaned +
//                                                     interestToPay +
//                                                     addedDefault) *
//                                                 100;

//                                             totalRepay =
//                                                 ((30 / 100) * totalRepayFirst)
//                                                     .round();

//                                             mystate(() {
//                                               isLoading = false;
//                                             });
//                                             chargeCard();
//                                           },
//                                           child: Container(
//                                             height: 15.h,
//                                             width: 30.w,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: oxygenPrimaryColor,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color: Color(0xFFBDBDBD),
//                                                     blurRadius: 5.0,
//                                                     offset: Offset(0.0, 0.75)),
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "30%",
//                                                 style: TextStyle(
//                                                     fontSize: 15.sp,
//                                                     fontFamily: "Muli",
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Visibility(
//                                         visible: !payRecord.contains("40"),
//                                         child: InkWell(
//                                           onTap: () {
//                                             percentagePay = "40";
//                                             int loaned = int.parse(
//                                                 widget.loanAmount.toString());
//                                             int interestToPay = int.parse(widget
//                                                 .interestAmount
//                                                 .toString());

//                                             int totalRepayFirst = (loaned +
//                                                     interestToPay +
//                                                     addedDefault) *
//                                                 100;
//                                             totalRepay =
//                                                 ((40 / 100) * totalRepayFirst)
//                                                     .round();

//                                             mystate(() {
//                                               isLoading = false;
//                                             });
//                                             chargeCard();
//                                           },
//                                           child: Container(
//                                             height: 15.h,
//                                             width: 30.w,
//                                             decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: oxygenPrimaryColor,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color: Color(0xFFBDBDBD),
//                                                     blurRadius: 5.0,
//                                                     offset: Offset(0.0, 0.75)),
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Text(
//                                                 "40%",
//                                                 style: TextStyle(
//                                                     fontSize: 15.sp,
//                                                     fontFamily: "Muli",
//                                                     color: Colors.white),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                       );
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
//       context: context,
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
//                     initialChildSize: 0.3,
//                     minChildSize: 0.2,
//                     maxChildSize: 0.30,
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
//                             InkWell(
//                               onTap: () {
//                                 newCard = true;
//                                 if (isPayingSplit) {
//                                   Navigator.pop(context);
//                                   showModal2();
//                                 } else {
//                                   chargeCard();
//                                 }
//                               },
//                               child: Container(
//                                 width: 100.w,
//                                 padding: EdgeInsets.all(3.w),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border: Border.all(
//                                       color: oxygenPrimaryColor, width: 1),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0xFFf1f0f0),
//                                       blurRadius: 5.0,
//                                     ),
//                                   ],
//                                   borderRadius: BorderRadius.circular(3.w),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Pay with new card",
//                                     style: TextStyle(
//                                         fontSize: 11.sp,
//                                         fontFamily: "Muli",
//                                         color: oxygenPrimaryColor),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 2.h),
//                             InkWell(
//                               onTap: () {
//                                 newCard = false;
//                                 Navigator.pop(context);
//                                 showModal4();
//                               },
//                               child: Container(
//                                 width: 100.w,
//                                 padding: EdgeInsets.all(3.w),
//                                 decoration: BoxDecoration(
//                                   color: oxygenPrimaryColor,
//                                   border: Border.all(
//                                       color: oxygenPrimaryColor, width: 1),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0xFFf1f0f0),
//                                       blurRadius: 5.0,
//                                     ),
//                                   ],
//                                   borderRadius: BorderRadius.circular(3.w),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Pay with saved card",
//                                     style: TextStyle(
//                                         fontSize: 11.sp,
//                                         fontFamily: "Muli",
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
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

//   showModal4() {
//     showModalBottomSheet(
//       context: context,
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
//                           children: [SizedBox(height: 4.h), completed()],
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

//   Widget completed() {
//     return StreamBuilder(
//         stream: OxygenApp.firestore
//             .collection('AddCard')
//             .where('userID', isEqualTo: userId)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 10.h),
//                   SpinKitDoubleBounce(
//                     color: oxygenPrimaryColor,
//                     size: 10.h,
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (snapshot.data!.docs.length < 1) {
//             return Center(
//               child: noItems("You do not have any saved card"),
//             );
//           }

//           return Container(
//             constraints: BoxConstraints(
//               minHeight: 40.h,
//             ),
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot _card = snapshot.data!.docs[index];

//                 return InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                       authCode = _card['authCode'];
//                       if (isPayingFull) {
//                         chargeAuth();
//                       } else {
//                         showModal2();
//                       }
//                     },
//                     child: bleBox(
//                       _card['authBank'],
//                       "**** **** **** " + _card['authLast'],
//                       _card['docId'],
//                     ));
//               },
//             ),
//           );
//         });
//   }

//   Widget noItems(String title) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//           Image.asset(
//             "assets/images/splash1.png",
//             height: 26.h,
//             width: 60.w,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: 2.h),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 10.sp, fontFamily: "Muli", color: Color(0xFF05242C)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget bleBox(String bank, String lastFour, String cardID) {
//     return Container(
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFFf1f0f0),
//               blurRadius: 5.0,
//             ),
//           ],
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Container(
//             padding: EdgeInsets.all(5.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       bank,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       lastFour,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () {},
//                   child: Icon(
//                     CupertinoIcons.chevron_right,
//                     size: 25.sp,
//                     color: Colors.blue,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> calculateRepay() async {
//     DateTime dueDate = DateTime.parse(widget.matDate.toString());
//     if (DateTime.now().isAfter(dueDate)) {
//       int differenceInDays = DateTime.now().difference(dueDate).inMinutes;
//       isAfterDueDate = true;
//       print("isafter");
//       int loaned = int.parse(widget.loanAmount.toString());
//       int interestToPay = int.parse(widget.interestAmount.toString());
//       int maxAdd = ((15 / 100) * loaned).round();
//       double dailyInterest = widget.interestRate / widget.loanPeriod;
//       double addedInterest = dailyInterest * differenceInDays;

//       int addedValue = ((addedInterest / 100) * loaned).round();
//       addedDefault = addedValue;
//       if (addedValue > maxAdd) {
//         totalRepay = (loaned + interestToPay + maxAdd) * 100;
//       } else {
//         totalRepay = (loaned + interestToPay + addedValue) * 100;
//       }
//       print(totalRepay);
//       print(loaned + interestToPay + maxAdd);
//       print(interestToPay + loaned);
//       print(differenceInDays);
//     } else {
//       int loaned = int.parse(widget.loanAmount.toString());
//       int interest = int.parse(widget.interestAmount.toString());

//       totalRepay = (loaned + interest) * 100;
//       //chargeCard();
//     }
//   }

//   Future<void> chargeAuth() async {
//     LoadersIcons().preloader(context);

//     // skTest -> Secret key
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $skTest'
//     };
//     Map data = {
//       "authorization_code": authCode,
//       "email": userEmail,
//       "amount": totalRepay
//     };
//     String payload = json.encode(data);

//     http.Response response = await http.post(
//         Uri.parse('https://api.paystack.co/transaction/charge_authorization'),
//         headers: headers,
//         body: payload);
//     final Map body = json.decode(response.body);
//     if (body['data']['status'] == 'success') {
//       updateDatabase().then((value) {
//         Navigator.pop(context);
//         setState(() {
//           code = "success";
//           showModal("You loan has been paid");
//         });

//         //inform admin if loan  repayment
//         String userName = OxygenApp.sharedPreferences!
//             .getString(OxygenApp.userUID)
//             .toString();
//         OxygenApp.firestore.collection("adminNotifications").doc().set({
//           "text": "$userName has paid back a shop loan for a loan",
//           "time": DateTime.now()
//               .add(Duration(days: 0, hours: 0, minutes: 0))
//               .toString(),
//         });

//         OxygenApp.firestore
//             .collection("users")
//             .doc("slwroSOR1nVG3M6uUHwuy454fBl2")
//             .update({
//           "unViewed": true,
//         });
//         OxygenApp.firestore
//             .collection("users")
//             .doc("zWAoct61hbNMw23tjTOPkZLRI6o1")
//             .update({
//           "unViewed": true,
//         });
//       });
//     } else {
//       AwesomeDialog(
//         context: context,
//         animType: AnimType.RIGHSLIDE,
//         headerAnimationLoop: true,
//         dialogType: DialogType.ERROR,
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                   height:
//                       SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "An error occured while repaying your loan, please try again",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 10.sp,
//                     fontFamily: "Muli",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   height: SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h)
//             ],
//           ),
//         ),
//         buttonsTextStyle: TextStyle(
//           fontSize: 10.sp,
//           fontFamily: "Muli",
//         ),
//         desc: 'Your response has been saved',
//         btnOkColor: Colors.red,
//         btnOkText: "Ok",
//         btnOkOnPress: () {},
//       ).show();
//     }
//     print(response.body);
//   }

//   Future<String> createAccessCode(skTest, _getReference) async {
//     // skTest -> Secret key
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $skTest'
//     };
//     Map data = {"amount": 600, "email": userEmail, "reference": _getReference};
//     String payload = json.encode(data);

//     http.Response response = await http.post(
//         Uri.parse('https://api.paystack.co/transaction/initialize'),
//         headers: headers,
//         body: payload);
//     final Map data2 = jsonDecode(response.body);
//     String accessCode = data2['data']['access_code'];
//     return accessCode;
//   }

//   void verifyOnServer(String reference) async {
//     LoadersIcons().preloader(context);
//     try {
//       Map<String, String> headers = {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $skTest'
//       };
//       http.Response response = await http.get(
//           Uri.parse('https://api.paystack.co/transaction/verify/' + reference),
//           headers: headers);
//       final Map body = json.decode(response.body);
//       if (body['data']['status'] == 'success') {
//         updateDatabase().then((value) {
//           Navigator.pop(context);
//           setState(() {
//             code = "success";
//             showModal("You loan has been paid");
//           });
//         });
//         print("trully paid");
//       } else {}
//     } catch (e) {
//       print(e);
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
//     Charge charge = Charge()
//       ..amount = totalRepay
//       ..reference = _getReference()
// //..accessCode = _createAcessCode(skTest, _getReference())
//       ..email = userEmail;
//     CheckoutResponse response = await plugin.checkout(
//       context,
//       method: CheckoutMethod.card,
//       charge: charge,
//     );
//     if (response.status == true) {
//       verifyOnServer(response.reference.toString());
//     } else {}
//   }

//   getDetails() async {
//     var ShopHistory2 =
//         await OxygenApp.firestore.collection('shops').doc(widget.loanID).get();
//     setState(() {
//       loanAMount = ShopHistory2["amount"];
//       loanID = ShopHistory2["loanID"];
//       shoppingCode = ShopHistory2["code"];
//       payRecord = ShopHistory2["paymentRecord"];
//       splittable = ShopHistory2["splitPayment"];
//       payingSPlitActive = ShopHistory2["payingSPlitActive"];
//       alreadyPayingSPlit = ShopHistory2["alreadyPayingSPlit"];
//       isLoading = false;
//     });
//     print(loanAMount);
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
//       print("paying full");
//       var userDetails =
//           await OxygenApp.firestore.collection('users').doc(userID).get();

//       int oldmaxLoan = userDetails["maxShopLoan"];
//       bool isAfter = true;
//       int pMaxloan = int.parse(widget.loanAmount);
//       double nMaxloan = (60 / 100) * pMaxloan;
//       int newMaxLoan = nMaxloan.round();
//       int saveMaxLoan = oldmaxLoan;
//       int summed = newMaxLoan + oldmaxLoan;
//       int eighty = ((80 / 100) * oldmaxLoan).round();
//       if (DateTime.parse(widget.matDate).isAfter(DateTime.now())) {
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
//         "isShopActive": "0",
//         "maxShopLoan": saveMaxLoan,
//         "firstShopTaken": true,
//       }).then((value) async {
//         await OxygenApp.sharedPreferences!
//             .setBool(OxygenApp.firstShopTaken, true);
//         await OxygenApp.sharedPreferences!
//             .setString(OxygenApp.isShopActive, "0");
//       });

//       OxygenApp.firestore.collection("shops").doc(widget.loanID).update({
//         "status": "2",
//         "paidOnTime": isAfter == false ? true : false,
//       }).then((value) {});

//       OxygenApp.firestore
//           .collection("users")
//           .doc(userID)
//           .collection("notifications")
//           .doc()
//           .set({
//         "text": "Your loan of ₦${{widget.loanAmount}} has been repaid",
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
//         OxygenApp.firestore.collection("shops").doc(widget.loanID).update({
//           "status": "2",
//           "paymentRecord": FieldValue.arrayUnion([percentagePay]),
//         }).then((value) {});

//         //user
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "isShopActive": "0",
//           "firstShopTaken": true,
//         }).then((value) async {
//           await OxygenApp.sharedPreferences!
//               .setBool(OxygenApp.firstShopTaken, true);
//         });

//         //notification
//         OxygenApp.firestore
//             .collection("users")
//             .doc(userID)
//             .collection("notifications")
//             .doc()
//             .set({
//           "text": "Your loan of ₦${widget.loanAmount} has been fully repaid",
//           "time": DateTime.now()
//               .add(Duration(days: 0, hours: 0, minutes: 0))
//               .toString(),
//         }).then((value) {
//           OxygenApp.firestore.collection("users").doc(userID).update({
//             "unViewed": true,
//           }).then((value) {});
//         });
//       } else {
//         OxygenApp.firestore.collection("shops").doc(widget.loanID).update({
//           "paymentRecord": FieldValue.arrayUnion([percentagePay]),
//           "payingSPlitActive": true,
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

//     setState(() {
//       skTest = loanDetails["skLive"].toString();
//       publicKey = loanDetails["pkLive"].toString();

//       if (skTest != null) {
//         initialisePaystack();
//       }
//       print(skTest);
//     });
//   }

//   Widget reviewDetailBox(String title, String value) {
//     return Container(
//         child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
//         ),
//         Container(
//           width: 100.w,
//           padding: EdgeInsets.all(4.w),
//           decoration: BoxDecoration(
//               border: Border.all(color: Colors.grey),
//               borderRadius: BorderRadius.circular(3.w)),
//           child: Text(
//             value,
//             style: TextStyle(
//                 fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
//           ),
//         ),
//       ],
//     ));
//   }
// }
