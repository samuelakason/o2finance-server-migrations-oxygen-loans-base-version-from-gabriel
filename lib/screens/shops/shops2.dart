// // ignore_for_file: avoid_single_cascade_in_expression_statements

// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server/gmail.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';

// import 'package:oxygen_loans/screens/shops/shop_history.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/services/push_notification_service.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';
// import 'package:http/http.dart' as http;

// class Shops2 extends StatefulWidget {
//   Shops2({Key? key, required this.shopTitle}) : super(key: key);
//   final String shopTitle;

//   @override
//   _Shops2State createState() => _Shops2State();
// }

// class _Shops2State extends State<Shops2> with TickerProviderStateMixin {
//   DateTime? maturityDateOuter;

//   String? employmentStatus =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.emplymentStatus);
//   bool isCalculated = false;
//   String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);
//   final smtpServer = gmail('o2internationalloans@gmail.com', 'TheMoneyPit1010');
//   String shoppingID = "Shopping Code";
//   String displayShoppingID = "";
//   String loanBalance = "";
//   String investmentBalance = "";
//   String purchaseCode = "67dhd9dj";
//   String emailSend = "";
//   bool sending = false;
//   bool isCodOut = false;
//   String generalListCurrent = "";
//   List<String> o2List = [
//     "Please select",
//     "Abuja",
//   ];
//   String currento2List = "Please select";

//   List<String> shopriteList = [
//     "Please select",
//     "Lagos",
//     "Abuja",
//   ];
//   String currentShopriteList = "Please select";

//   List<String> sparList = [
//     "Please select",
//     "Lagos",
//     "Abuja",
//   ];
//   String currentSparList = "Please select";

//   List<String> hmdexiList = [
//     "Please select",
//     "Abuja",
//   ];
//   String currenthmdexiList = "Please select";

//   List<String> gameList = [
//     "Please select",
//     "Lagos",
//     "Abuja",
//   ];
//   String currentGameList = "Please select";

//   List<String> mSquareList = [
//     "Please select",
//     "Lagos",
//     "Abuja",
//     "Portharcourt",
//   ];
//   String currentmSqaureList = "Please select";

//   List<String> ebanoList = [
//     "Please select",
//     "Lagos",
//   ];
//   String currentEbeanoList = "Please select";

//   List<String> repayList = [
//     "Please select",
//     "7 days",
//     "14 days",
//     "30 days",
//     "6 months",
//     "12 months",
//   ];
//   String currentrepayList = "Please select";
//   final TextEditingController _amountTextEditingController =
//       TextEditingController();
//   final TextEditingController _passwordTextEditingController =
//       TextEditingController();
//   List alpha = [
//     "a",
//     "b",
//     "c",
//     "d",
//     "e",
//     "f",
//     "g",
//     "h",
//     "i",
//     "j",
//     "k",
//     "l",
//     "m",
//     "n",
//     "o",
//     "p",
//     "q",
//     "r",
//     "s",
//     "t",
//     "u",
//     "v",
//     "w",
//     "x",
//     "y",
//     "z",
//   ];

//   List numeric = [
//     "0"
//         "1",
//     "2",
//     "3",
//     "4",
//     "5",
//     "6",
//     "7",
//     "8",
//     "9",
//   ];
//   String localPin =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.localPin).toString();
//   int maxLoan = 5000;
//   int interest = 0;
//   String validityDate = "";
//   AnimationController? _controller;
//   Animation<Offset>? _animation;
//   bool cardCollected = false;
//   bool? firstShopTaken;
//   PushNotificationService pushNotificationService = PushNotificationService();
//   String adminToken1 = '';
//   String adminToken2 = '';

//   @override
//   void initState() {
//     super.initState();
//     getDetails();
//     calculateCurrentLoan();
//     getWalletDetails();
//     getAdminFcmToken();
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

//   @override
//   dispose() {
//     _controller!.dispose(); // you need this
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("Shops"),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(4.w),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: SlideTransition(
//                 position: _animation!,
//                 transformHitTests: true,
//                 textDirection: TextDirection.ltr,
//                 child: Container(
//                   height: 20.h,
//                   width: 20.h,
//                   padding: EdgeInsets.all(5.w),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle, color: oxygenPrimaryColor),
//                   child: Center(
//                     child: isCalculated == false
//                         ? Text(
//                             "0",
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                             ),
//                           )
//                         : Text(
//                             "₦" + maxLoan.toString(),
//                             style: TextStyle(
//                               fontSize: 20.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                             ),
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 2.h),
//             employmentStatus == null
//                 ? Text(
//                     "You have not completed your profile, please go to the loan section to update profile information",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: "Muli",
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF093D49),
//                     ),
//                   )
//                 : Container(
//                     child: isCalculated == false
//                         ? Text(
//                             "Please wait.... we are calculating your best loan amount",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xFF093D49),
//                             ),
//                           )
//                         : Text(
//                             "Your current maximum loanable amount, repay your loan promptly to increase this amount",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.w400,
//                               color: Color(0xFF093D49),
//                             ),
//                           ),
//                   ),
//             SizedBox(height: 2.h),
//             Text(
//               "How much worth of goods do you want to purchase?",
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontFamily: "Muli",
//                 color: Color(0xFF05242C),
//               ),
//             ),
//             SizedBox(height: 2.h),
//             authFormField("Amount to be paid ", _amountTextEditingController,
//                 "Enter amount", false),
//             SizedBox(height: 1.h),
//             o2mall(),
//             shoprite(),
//             spar(),
//             hmedix(),
//             game(),
//             mSquare(),
//             ebeano(),
//             SizedBox(height: 2.h),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Repayment period",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentrepayList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         if (newValue == "6 months" || newValue == "12 months") {
//                           AwesomeDialog(
//                             context: context,
//                             animType: AnimType.RIGHSLIDE,
//                             headerAnimationLoop: true,
//                             dialogType: DialogType.ERROR,
//                             body: Center(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "You are not eligible for this repayment period, Apply for loans and pay on time to qualify",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontFamily: "Muli",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                                 ],
//                               ),
//                             ),
//                             buttonsTextStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontFamily: "Muli",
//                             ),
//                             desc: 'Your response has been saved',
//                             btnOkColor: Colors.red,
//                             btnOkText: "Ok",
//                             btnOkOnPress: () {},
//                           ).show();
//                         } else {
//                           setState(() {
//                             currentrepayList = newValue!;
//                             validityDate = newValue;
//                             interestCalculate();
//                           });
//                         }
//                       },
//                       items: repayList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 3.h),
//             authFormField(
//                 "Input Your pin", _passwordTextEditingController, "****", true),
//             SizedBox(height: 2.h),
//             MainButton(
//                 title: "Proceed",
//                 callback: () {
//                   if (cardCollected) {
//                     if (_amountTextEditingController.text.isNotEmpty &&
//                         _passwordTextEditingController.text.isNotEmpty &&
//                         generalListCurrent != "Please select") {
//                       if (_passwordTextEditingController.text.trim() ==
//                           localPin) {
//                         if (double.parse(
//                                 _amountTextEditingController.text.trim()) <=
//                             double.parse(maxLoan.toString())) {
//                           confirmShop();
//                         } else {
//                           AwesomeDialog(
//                             context: context,
//                             animType: AnimType.RIGHSLIDE,
//                             headerAnimationLoop: true,
//                             dialogType: DialogType.ERROR,
//                             body: Center(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Invalid amount",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontFamily: "Muli",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                                 ],
//                               ),
//                             ),
//                             buttonsTextStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontFamily: "Muli",
//                             ),
//                             desc: 'Your response has been saved',
//                             btnOkColor: Colors.red,
//                             btnOkText: "Cancel",
//                             btnOkOnPress: () {},
//                           )..show();
//                         }
//                       } else {
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
//                                     "Wrong pin",
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
//                           btnOkColor: Colors.red,
//                           btnOkText: "Try again",
//                           btnOkOnPress: () {},
//                         )..show();
//                       }
//                     } else {
//                       AwesomeDialog(
//                         context: context,
//                         animType: AnimType.RIGHSLIDE,
//                         headerAnimationLoop: true,
//                         dialogType: DialogType.ERROR,
//                         body: Center(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                   height:
//                                       SizerUtil.deviceType == DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Please complete form",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 10.sp,
//                                     fontFamily: "Muli",
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                   height:
//                                       SizerUtil.deviceType == DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                             ],
//                           ),
//                         ),
//                         buttonsTextStyle: TextStyle(
//                           fontSize: 10.sp,
//                           fontFamily: "Muli",
//                         ),
//                         desc: 'Your response has been saved',
//                         btnOkColor: Colors.red,
//                         btnOkText: "Cancel",
//                         btnOkOnPress: () {},
//                       )..show();
//                     }
//                   } else {
//                     AwesomeDialog(
//                       context: context,
//                       animType: AnimType.RIGHSLIDE,
//                       headerAnimationLoop: true,
//                       dialogType: DialogType.ERROR,
//                       body: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                                 height:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 "Please apply to be an O2 member and wait for your  card to be processed before using the shop",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: "Muli",
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                                 height:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h)
//                           ],
//                         ),
//                       ),
//                       buttonsTextStyle: TextStyle(
//                         fontSize: 10.sp,
//                         fontFamily: "Muli",
//                       ),
//                       desc: 'Your response has been saved',
//                       btnOkColor: Colors.red,
//                       btnOkText: "Cancel",
//                       btnOkOnPress: () {},
//                     )..show();
//                   }
//                   if (cardCollected) {
//                     if (_amountTextEditingController.text.isNotEmpty &&
//                         _passwordTextEditingController.text.isNotEmpty &&
//                         generalListCurrent != "Please select") {
//                       if (_passwordTextEditingController.text.trim() ==
//                           localPin) {
//                         if (double.parse(
//                                 _amountTextEditingController.text.trim()) <=
//                             double.parse(maxLoan.toString())) {
//                           confirmShop();
//                         } else {
//                           AwesomeDialog(
//                             context: context,
//                             animType: AnimType.RIGHSLIDE,
//                             headerAnimationLoop: true,
//                             dialogType: DialogType.ERROR,
//                             body: Center(
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       "Invalid amount",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         fontFamily: "Muli",
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height: SizerUtil.deviceType ==
//                                               DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                                 ],
//                               ),
//                             ),
//                             buttonsTextStyle: TextStyle(
//                               fontSize: 10.sp,
//                               fontFamily: "Muli",
//                             ),
//                             desc: 'Your response has been saved',
//                             btnOkColor: Colors.red,
//                             btnOkText: "Cancel",
//                             btnOkOnPress: () {},
//                           )..show();
//                         }
//                       } else {
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
//                                     "Wrong pin",
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
//                           btnOkColor: Colors.red,
//                           btnOkText: "Try again",
//                           btnOkOnPress: () {},
//                         )..show();
//                       }
//                     } else {
//                       AwesomeDialog(
//                         context: context,
//                         animType: AnimType.RIGHSLIDE,
//                         headerAnimationLoop: true,
//                         dialogType: DialogType.ERROR,
//                         body: Center(
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                   height:
//                                       SizerUtil.deviceType == DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   "Please complete form",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 10.sp,
//                                     fontFamily: "Muli",
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                   height:
//                                       SizerUtil.deviceType == DeviceType.mobile
//                                           ? 1.h
//                                           : 4.h)
//                             ],
//                           ),
//                         ),
//                         buttonsTextStyle: TextStyle(
//                           fontSize: 10.sp,
//                           fontFamily: "Muli",
//                         ),
//                         desc: 'Your response has been saved',
//                         btnOkColor: Colors.red,
//                         btnOkText: "Cancel",
//                         btnOkOnPress: () {},
//                       )..show();
//                     }
//                   } else {
//                     AwesomeDialog(
//                       context: context,
//                       animType: AnimType.RIGHSLIDE,
//                       headerAnimationLoop: true,
//                       dialogType: DialogType.ERROR,
//                       body: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(
//                                 height:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 "Please apply to be an O2 member and wait for your  card to be processed before using the shop",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: "Muli",
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                                 height:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 1.h
//                                         : 4.h)
//                           ],
//                         ),
//                       ),
//                       buttonsTextStyle: TextStyle(
//                         fontSize: 10.sp,
//                         fontFamily: "Muli",
//                       ),
//                       desc: 'Your response has been saved',
//                       btnOkColor: Colors.red,
//                       btnOkText: "Cancel",
//                       btnOkOnPress: () {},
//                     )..show();
//                   }
//                 })
//           ],
//         ),
//       ),
//     );
//   }

//   Widget o2mall() {
//     return Visibility(
//         visible: widget.shopTitle == "02 mall",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select 02 mall Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currento2List,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currento2List = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: o2List.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget shoprite() {
//     return Visibility(
//         visible: widget.shopTitle == "Shoprite",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select Shoprite Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentShopriteList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currentShopriteList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: shopriteList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget spar() {
//     return Visibility(
//         visible: widget.shopTitle == "Spar",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select Spar Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentSparList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currentSparList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: sparList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget hmedix() {
//     return Visibility(
//         visible: widget.shopTitle == "H-Medix",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select H-Medix Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currenthmdexiList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currenthmdexiList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: hmdexiList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget game() {
//     return Visibility(
//         visible: widget.shopTitle == "Game",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select Game Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentGameList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currentGameList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: gameList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget mSquare() {
//     return Visibility(
//         visible: widget.shopTitle == "Market Square",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select Market Square Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentmSqaureList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currentmSqaureList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: mSquareList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget ebeano() {
//     return Visibility(
//         visible: widget.shopTitle == "Ebeano",
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 "Select Ebeano Location",
//                 style: TextStyle(
//                     fontSize: 11.sp, fontFamily: "Muli", color: Colors.black),
//               ),
//             ),
//             SizedBox(height: 1.h),
//             FormField<String>(
//               builder: (FormFieldState<String> state) {
//                 return InputDecorator(
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: 2.3.h, vertical: 2.3.h),
//                     fillColor: Color(0xFF0f1245),
//                     border: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(10.0),
//                       borderSide:
//                           new BorderSide(width: 2, color: Color(0xFF025373)),
//                     ),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       value: currentEbeanoList,
//                       isDense: true,
//                       onChanged: (newValue) {
//                         setState(() {
//                           currentEbeanoList = newValue!;
//                           generalListCurrent = newValue;
//                         });
//                       },
//                       items: ebanoList.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(
//                             value,
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                     SizerUtil.deviceType == DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ));
//   }

//   Widget authFormField(String title, TextEditingController controller,
//       String hint, bool isObscure) {
//     return Column(
//       children: [
//         Align(
//           alignment: Alignment.bottomLeft,
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 11.sp,
//               fontFamily: "Muli",
//               color: Colors.black,
//             ),
//           ),
//         ),
//         SizedBox(height: 1.h),
//         TextFormField(
//           controller: controller,
//           obscureText: isObscure,
//           style: TextStyle(
//               color: Colors.black,
//               fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
//           decoration: InputDecoration(
//             floatingLabelBehavior: FloatingLabelBehavior.never,
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
//             labelText: hint,
//             labelStyle: TextStyle(
//                 fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
//             fillColor: Color(0xFF0f1245),
//             border: OutlineInputBorder(
//               borderRadius: new BorderRadius.circular(2.w),
//               borderSide: const BorderSide(color: Colors.white, width: 1.0),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey, width: 0.9),
//               borderRadius: BorderRadius.circular(2.w),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey, width: 0.9),
//               borderRadius: BorderRadius.circular(2.w),
//             ),
//           ),
//         ),
//         SizedBox(height: 2.h),
//       ],
//     );
//   }

//   confirmShop() {
//     showAnimatedDialog(
//         context: context,
//         barrierDismissible: true,
//         animationType: DialogTransitionType.slideFromBottom,
//         curve: Curves.fastOutSlowIn,
//         duration: Duration(milliseconds: 700),
//         builder: (c) {
//           return StatefulBuilder(builder: (context, setState) {
//             return AlertDialog(
//               content: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12.w),
//                   color: Colors.white,
//                 ),
//                 height: 65.h,
//                 width: 90.w,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Align(
//                           alignment: Alignment.bottomRight,
//                           child:
//                               Icon(CupertinoIcons.xmark, color: Colors.grey)),
//                     ),
//                     SizedBox(height: 2.h),
//                     Text(
//                       "Confirmation",
//                       style: TextStyle(
//                         fontSize: 13.sp,
//                         fontFamily: "Muli",
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF05242C),
//                       ),
//                     ),
//                     SizedBox(height: 1.h),
//                     Text(
//                       "Important: If you send a request for a shopping code, it can not be reversed, ensure you are ready to use it before sending a request",
//                       style: TextStyle(
//                         fontSize: 12.sp,
//                         fontFamily: "Muli",
//                         color: Colors.red,
//                       ),
//                     ),
//                     SizedBox(height: 1.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Loan",
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             fontFamily: "Muli",
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF05242C),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(4.w),
//                           decoration: BoxDecoration(
//                               color: Color(0xFFebecf0),
//                               borderRadius: BorderRadius.circular(4.w)),
//                           child: Text(
//                             "₦" + _amountTextEditingController.text.trim(),
//                             style: TextStyle(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF05242C),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 1.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Interest",
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             fontFamily: "Muli",
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF05242C),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(4.w),
//                           decoration: BoxDecoration(
//                               color: Color(0xFFebecf0),
//                               borderRadius: BorderRadius.circular(4.w)),
//                           child: Text(
//                             "₦" + interest.toString(),
//                             style: TextStyle(
//                               fontSize: 13.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF05242C),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 1.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Due date",
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             fontFamily: "Muli",
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF05242C),
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.all(4.w),
//                           decoration: BoxDecoration(
//                               color: Color(0xFFebecf0),
//                               borderRadius: BorderRadius.circular(4.w)),
//                           child: Text(
//                             OxygenApp.timeFormat2.format(maturityDateOuter!),
//                             style: TextStyle(
//                               fontSize: 11.sp,
//                               fontFamily: "Muli",
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF05242C),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 3.h),
//                     InkWell(
//                       onTap: () async {
//                         LoadersIcons().preloader(context);
//                         await sendRequest();
//                         saveShopInfo();
//                       },
//                       child: Container(
//                         width: 100.w,
//                         child: DecoratedBox(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3.w),
//                               gradient: LinearGradient(colors: [
//                                 oxygenPrimaryColor,
//                                 oxygenPrimaryColor
//                               ])),
//                           child: Container(
//                             height: 8.h,
//                             padding: EdgeInsets.all(4.w),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Send request",
//                                   style: TextStyle(
//                                       fontSize: 12.sp,
//                                       fontFamily: "Muli",
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 SizedBox(width: 4.w),
//                                 Visibility(
//                                   visible: sending,
//                                   child: Container(
//                                     height: 6.h,
//                                     child: SpinKitDoubleBounce(
//                                         color: Colors.white, size: 6.h),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           });
//         });
//   }

//   calculateCurrentLoan() async {
//     print(firstShopTaken);
//     await getWalletDetails();

//     if (firstShopTaken == false) {
//       String? employmentStatus =
//           OxygenApp.sharedPreferences!.getString(OxygenApp.emplymentStatus);

//       if (employmentStatus == "Student" || employmentStatus == "Unemployed") {
//         maxLoan = 3000;
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "maxShopLoan": 3000,
//         }).then((value) {
//           setState(() {
//             isCalculated = true;
//           });
//         });
//       }

//       if (employmentStatus == "Self employed" ||
//           employmentStatus == "Employee" ||
//           employmentStatus == "Employer") {
//         maxLoan = 5000;
//         OxygenApp.firestore.collection("users").doc(userID).update({
//           "maxShopLoan": 5000,
//         }).then((value) {
//           setState(() {
//             isCalculated = true;
//           });
//         });
//       }
//     }
//     if (firstShopTaken == true) {
//       var userDetails =
//           await OxygenApp.firestore.collection('users').doc(userID).get();

//       int oldmaxLoan = userDetails["maxShopLoan"];
//       setState(() {
//         maxLoan = oldmaxLoan;
//         isCalculated = true;
//       });
//     }
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
//                               CupertinoIcons.xmark_circle,
//                               color: Colors.red,
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
//                                   Navigator.pop(context);
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

//   sendRequest() async {
//     var rng = new Random();
//     String first = alpha[rng.nextInt(25)];
//     String second = alpha[rng.nextInt(25)];
//     String third = numeric[rng.nextInt(9)];
//     String fourth = numeric[rng.nextInt(9)];
//     String fifth = numeric[rng.nextInt(9)];
//     String sixth = alpha[rng.nextInt(25)];
//     String seventh = alpha[rng.nextInt(25)];
//     String eight = alpha[rng.nextInt(25)];

//     shoppingID =
//         first + second + third + fourth + fifth + sixth + seventh + eight;
//     print(shoppingID);
//   }

//   getDetails() async {
//     String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);

//     var userDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();
//     setState(() {
//       loanBalance = userDetails["loan"].toString();
//       investmentBalance = userDetails["investment"].toString();
//     });
//   }

//   Future<void> saveShopInfo() async {
//     int interest = 0;
//     String? username =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userName);

//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     DocumentReference documentReference =
//         OxygenApp.firestore.collection("shops").doc();
//     int amountShop = int.parse(_amountTextEditingController.text.trim());

//     if (currentrepayList == "7 days") {
//       String maturityDate = DateTime.now()
//           .add(Duration(days: 7, hours: 0, minutes: 1))
//           .toString();
//       interest = ((8 / 100) * amountShop).round();
//       documentReference.set({
//         "shopName": widget.shopTitle,
//         "shopLocation": generalListCurrent,
//         "loanID": documentReference.id,
//         "userId": userID,
//         "interest": interest,
//         "amount": amountShop.toString(),
//         "date": DateTime.now(),
//         "maturity": maturityDate,
//         "status": "0",
//         "splitPayment": false,
//         "payingSPlitActive": false,
//         "paymentRecord": [],
//         "interestRate": 8,
//         "loanPeriod": 7,
//         "alreadyPayingSPlit": false,
//         "paidOnTime": false,
//         "code": shoppingID,
//         'username': username,
//         "calculationPeriod":
//             DateTime.now().add(Duration(days: 0, hours: 0, minutes: 30)),
//       }).then((value) {
//         Route route = MaterialPageRoute(
//             builder: (_) => MainScreen(
//                   sIndex: 3,
//                 ));
//         Navigator.pushReplacement(context, route);
//         AwesomeDialog(
//           context: context,
//           animType: AnimType.RIGHSLIDE,
//           headerAnimationLoop: true,
//           dialogType: DialogType.SUCCES,
//           body: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Your loan request has been received and pending approval",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       fontFamily: "Muli",
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h)
//               ],
//             ),
//           ),
//           buttonsTextStyle: TextStyle(
//             fontSize: 10.sp,
//             fontFamily: "Muli",
//           ),
//           desc: 'Your response has been saved',
//           btnOkColor: Colors.green,
//           btnOkText: "OK",
//           btnOkOnPress: () {},
//         )..show();
//       });
//     }
//     if (currentrepayList == "14 days") {
//       String maturityDate = DateTime.now()
//           .add(Duration(days: 14, hours: 0, minutes: 1))
//           .toString();
//       interest = ((15 / 100) * amountShop).round();
//       documentReference.set({
//         "shopName": widget.shopTitle,
//         "shopLocation": generalListCurrent,
//         "loanID": documentReference.id,
//         "userId": userID,
//         "interest": interest,
//         "amount": amountShop.toString(),
//         "date": DateTime.now(),
//         "maturity": maturityDate,
//         "status": "0",
//         "splitPayment": false,
//         "payingSPlitActive": false,
//         "paymentRecord": [],
//         "interestRate": 15,
//         "loanPeriod": 14,
//         "alreadyPayingSPlit": false,
//         "paidOnTime": false,
//         "code": shoppingID,
//         'username': username,
//         "calculationPeriod":
//             DateTime.now().add(Duration(days: 0, hours: 0, minutes: 30)),
//       }).then((value) {
//         Route route = MaterialPageRoute(
//             builder: (_) => MainScreen(
//                   sIndex: 3,
//                 ));
//         Navigator.pushReplacement(context, route);
//         AwesomeDialog(
//           context: context,
//           animType: AnimType.RIGHSLIDE,
//           headerAnimationLoop: true,
//           dialogType: DialogType.SUCCES,
//           body: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Your loan request has been received adn pending approval",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       fontFamily: "Muli",
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h)
//               ],
//             ),
//           ),
//           buttonsTextStyle: TextStyle(
//             fontSize: 10.sp,
//             fontFamily: "Muli",
//           ),
//           desc: 'Your response has been saved',
//           btnOkColor: Colors.green,
//           btnOkText: "Ok",
//           btnOkOnPress: () {},
//         )..show();
//       });
//     }
//     if (currentrepayList == "30 days") {
//       String maturityDate = DateTime.now()
//           .add(Duration(days: 30, hours: 0, minutes: 1))
//           .toString();
//       interest = ((30 / 100) * amountShop).round();
//       documentReference.set({
//         "shopName": widget.shopTitle,
//         "shopLocation": generalListCurrent,
//         "loanID": documentReference.id,
//         "userId": userID,
//         "interest": interest,
//         "amount": amountShop.toString(),
//         "date": DateTime.now(),
//         "maturity": maturityDate,
//         "status": "0",
//         "splitPayment": true,
//         "payingSPlitActive": false,
//         "paymentRecord": [],
//         "interestRate": 30,
//         "loanPeriod": 30,
//         "alreadyPayingSPlit": false,
//         "paidOnTime": false,
//         "code": shoppingID,
//         'username': username,
//         "calculationPeriod":
//             DateTime.now().add(Duration(days: 0, hours: 0, minutes: 30)),
//       }).then((value) {
//         Route route = MaterialPageRoute(
//             builder: (_) => MainScreen(
//                   sIndex: 3,
//                 ));
//         Navigator.pushReplacement(context, route);
//         AwesomeDialog(
//           context: context,
//           animType: AnimType.RIGHSLIDE,
//           headerAnimationLoop: true,
//           dialogType: DialogType.SUCCES,
//           body: Center(
//             child: Column(
//               children: [
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "Your loan request has been received adn pending approval",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       fontFamily: "Muli",
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                     height:
//                         SizerUtil.deviceType == DeviceType.mobile ? 1.h : 4.h)
//               ],
//             ),
//           ),
//           buttonsTextStyle: TextStyle(
//             fontSize: 10.sp,
//             fontFamily: "Muli",
//           ),
//           desc: 'Your response has been saved',
//           btnOkColor: Colors.green,
//           btnOkText: "Navigate to dashboard",
//           btnOkOnPress: () {},
//         )..show();
//       });
//     }

//     OxygenApp.firestore.collection("adminNotifications").doc().set({
//       "text": "A user has applied for a shop loan of $amountShop",
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
//         'New Loan Application',
//         "A user has applied for a shop loan of $amountShop");
//     await pushNotificationService.sendPushNotification(
//         adminToken2,
//         'New Loan Application',
//         "A user has applied for a shop loan of $amountShop");

//     OxygenApp.firestore.collection("users").doc(userID).update({
//       "isShopActive": "1",
//     }).then((value) async {
//       await OxygenApp.sharedPreferences!.setString(OxygenApp.isShopActive, "1");
//     });
//   }

//   Future<void> interestCalculate() async {
//     int p = int.parse(_amountTextEditingController.text.trim());
//     if (validityDate == "7 days") {
//       DateTime maturityDate =
//           DateTime.now().add(Duration(days: 7, hours: 0, minutes: 1));
//       maturityDateOuter = maturityDate;
//       interest = ((8 / 100) * p).round();
//     } else if (validityDate == "14 days") {
//       DateTime maturityDate = DateTime.now().add(Duration(days: 14, hours: 5));
//       maturityDateOuter = maturityDate;
//       interest = ((15 / 100) * p).round();
//     } else if (validityDate == "30 days") {
//       DateTime maturityDate = DateTime.now().add(Duration(days: 30, hours: 5));
//       maturityDateOuter = maturityDate;
//       interest = ((30 / 100) * p).round();
//     }
//     print(interest);
//   }

//   getWalletDetails() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();

//     setState(() {
//       cardCollected = loanDetails["isCardColledted"];
//       firstShopTaken = loanDetails["firstShopTaken"];
//     });
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
// }
