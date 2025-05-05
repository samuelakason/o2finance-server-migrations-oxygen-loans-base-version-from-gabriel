// // ignore_for_file: prefer_const_constructors

// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';
// import 'package:http/http.dart' as http;

// class Product3 extends StatefulWidget {
//   Product3({Key? key, required this.investementAmount, required this.period})
//       : super(key: key);
//   final String investementAmount;
//   final String period;

//   @override
//   _Product3State createState() => _Product3State();
// }

// class _Product3State extends State<Product3> {
//   String mPerido = "";
//   String iRate = "15%";
//   String iValue = "";
//   String tAmount = "";
//   bool isLoading = false;
//   var publicKey = 'pk_test_7bf02b6c3037a8ca2fe324a9d102a10089b21a7a';
//   final plugin = PaystackPlugin();
//   String skTest = "sk_test_273c814d7c96c32e4310fbd722f00e7d3fa620f7";
//   @override
//   void initState() {
//     super.initState();
//     calculateInterest();
//     plugin.initialize(publicKey: publicKey);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("02 keep"),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Investment Details",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF05242C),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 infoBox("Investment amount", widget.investementAmount),
//                 SizedBox(height: 2.h),
//                 infoBox("Investment period", widget.period),
//                 SizedBox(height: 24),
//                 Text(
//                   "Summary",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: "Muli",
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF05242C),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Column(children: [
//                   detailBox("Maturity Period", mPerido),
//                   SizedBox(height: 1.h),
//                   detailBox("Interest period", iRate),
//                   SizedBox(height: 1.h),
//                   detailBox("Interest Value", iValue),
//                   SizedBox(height: 1.h),
//                   detailBox("Total Amount", tAmount),
//                   SizedBox(height: 1.h),
//                   InkWell(
//                     onTap: () {
//                       chargeCard();
//                     },
//                     child: Container(
//                       width: 100.w,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3.w),
//                             gradient: LinearGradient(colors: [
//                               oxygenPrimaryColor,
//                               oxygenPrimaryColor
//                             ])),
//                         child: Container(
//                           height: 8.h,
//                           padding: EdgeInsets.all(4.w),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Confirm",
//                                 style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontFamily: "Muli",
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(width: 4.w),
//                               Visibility(
//                                 visible: isLoading,
//                                 child: Container(
//                                   height: 6.h,
//                                   child: SpinKitDoubleBounce(
//                                       color: Colors.white, size: 6.h),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ])
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget infoBox(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontFamily: "Muli",
//             color: Color(0xFF05242C),
//           ),
//         ),
//         Container(
//           width: 100.w,
//           padding: EdgeInsets.fromLTRB(3.w, 4.w, 3.w, 4.w),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(3.w),
//           ),
//           child: Text(
//             value,
//             style: TextStyle(
//               fontSize: 12.sp,
//               fontFamily: "Muli",
//               color: Color(0xFF05242C),
//             ),
//           ),
//         ),
//       ],
//     );
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

//   Widget detailBox(String title, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontFamily: "Muli",
//             color: Color(0xFF093D49),
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontFamily: "Muli",
//             color: Color(0xFF093D49),
//           ),
//         ),
//       ],
//     );
//   }

//   showModal() {
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
//                               CupertinoIcons.check_mark_circled,
//                               color: oxygenPrimaryColor,
//                               size: 12.h,
//                             ),
//                             Text(
//                               "Investment of ${widget.investementAmount} from 02 wallet is successful",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 11.sp,
//                                   fontFamily: "Muli",
//                                   color: Colors.black),
//                             ),
//                             SizedBox(height: 4.h),
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(2.w),
//                                   border:
//                                       Border.all(color: oxygenPrimaryColor)),
//                               height: 8.h,
//                               width: double.infinity,
//                               child: FlatButton(
//                                 child: Text(
//                                   "Okay",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 onPressed: () {
//                                   Route route = MaterialPageRoute(
//                                       builder: (_) => MainScreen(sIndex: 0));
//                                   Navigator.pushReplacement(context, route);
//                                 },
//                                 color: Colors.white,
//                                 textColor: oxygenPrimaryColor,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(2.w),
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
//           ;
//         });
//       },
//     );
//   }

//   calculateInterest() {
//     if (widget.period == "3 months") {
//       mPerido = DateTime.now().add(Duration(days: 90, hours: 0)).toString();
//       int p = int.parse(widget.investementAmount);
//       int r = 15;
//       int t = 1;

//       int si = (((p * r * t) / 100) / 4).round();
//       setState(() {
//         mPerido = p.toString();
//         iValue = si.toString();
//         tAmount = (si + p).toString();
//       });
//     }

//     if (widget.period == "6 months") {
//       mPerido = DateTime.now().add(Duration(days: 90, hours: 0)).toString();
//       int p = int.parse(widget.investementAmount);
//       int r = 15;
//       int t = 1;

//       int si = (((p * r * t) / 100) / 2).round();
//       setState(() {
//         mPerido = p.toString();
//         iValue = si.toString();
//         tAmount = (si + p).toString();
//       });
//     }
//     if (widget.period == "9 months") {
//       mPerido = DateTime.now().add(Duration(days: 90, hours: 0)).toString();
//       int p = int.parse(widget.investementAmount);
//       int r = 15;
//       int t = 1;

//       int si = (((p * r * t) / 100) / 1.33).round();
//       setState(() {
//         mPerido = p.toString();
//         iValue = si.toString();
//         tAmount = (si + p).toString();
//       });
//     }
//     if (widget.period == "12 months") {
//       mPerido = DateTime.now().add(Duration(days: 90, hours: 0)).toString();
//       int p = int.parse(widget.investementAmount);
//       int r = 15;
//       int t = 1;

//       int si = (((p * r * t) / 100) / 1).round();
//       setState(() {
//         mPerido = p.toString();
//         iValue = si.toString();
//         tAmount = (si + p).toString();
//       });
//     }
//   }

//   Future<String> createAccessCode(skTest, _getReference) async {
//     // skTest -> Secret key
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $skTest'
//     };
//     Map data = {
//       "amount": 600,
//       "email": "emailaddress@gmail.com",
//       "reference": _getReference
//     };
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
//         setState(() {});

//         makeInvestement();
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
//       ..amount = int.parse(widget.investementAmount + "00")
//       ..reference = _getReference()
// //..accessCode = _createAcessCode(skTest, _getReference())
//       ..email = 'customer@email.com';
//     CheckoutResponse response = await plugin.checkout(
//       context,
//       method: CheckoutMethod.card,
//       charge: charge,
//     );
//     if (response.status == true) {
//       verifyOnServer(response.reference.toString());
//     } else {}
//   }

//   makeInvestement() {
//     setState(() {
//       isLoading = true;
//     });
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     OxygenApp.firestore.collection("investments").doc().set({
//       "user": userID,
//       "type": "02 keep",
//       "period": widget.period,
//       "principa": widget.investementAmount,
//       "interest": iValue,
//       "totalReturns": tAmount,
//     }).then((value) async {
//       var loanDetails =
//           await OxygenApp.firestore.collection('users').doc(userID).get();

//       double previousAMount = double.parse(loanDetails["investment"]);

//       OxygenApp.firestore.collection("users").doc(userID).update({
//         "investment": previousAMount + int.parse(widget.investementAmount),
//       });

//       setState(() {
//         isLoading = false;
//         showModal();
//       });
//     });
//   }
// }
