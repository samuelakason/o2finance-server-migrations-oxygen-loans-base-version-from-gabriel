// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/invest/fix2.dart';
// import 'package:oxygen_loans/screens/invest/invest_details.dart';

// import 'package:oxygen_loans/screens/invest/keep2.dart';
// import 'package:oxygen_loans/screens/invest/lock2.dart';
// import 'package:oxygen_loans/screens/invest/product2.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:sizer/sizer.dart';
// import 'package:sizer/sizer.dart';

// class Invest extends StatefulWidget {
//   Invest({Key? key}) : super(key: key);

//   @override
//   _InvestState createState() => _InvestState();
// }

// class _InvestState extends State<Invest> {
//   String investmentBalance = "";
//   @override
//   void initState() {
//     super.initState();
//     getDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar("Investment"),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(4.w),
//           child: Container(
//             child: Column(
//               children: [
//                 Container(
//                   height: 25.h,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF00AEFF),
//                     borderRadius: BorderRadius.all(Radius.circular(4.w)),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 6.w, left: 4.w),
//                     child: Row(
//                       children: [
//                         Container(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "YOUR INVESTMENT BALANCE",
//                                 style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: "Muli",
//                                   color: Color(0xFFffffff),
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                               Align(
//                                 alignment: Alignment.bottomLeft,
//                                 child: Row(
//                                   children: [
//                                     SvgPicture.asset("assets/icons/bNaira.svg"),
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: investmentBalance == ""
//                                           ? SpinKitDoubleBounce(
//                                               color: Colors.white, size: 5.h)
//                                           : Text(
//                                               investmentBalance,
//                                               style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontFamily: "Muli",
//                                                 color: Color(0xFFffffff),
//                                               ),
//                                             ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 5.h),
//                               FlatButton(
//                                 padding:
//                                     EdgeInsets.fromLTRB(5.w, 4.w, 5.w, 4.w),
//                                 child: Text(
//                                   "View Portfolio",
//                                   style: TextStyle(fontSize: 13.sp),
//                                 ),
//                                 onPressed: () {
//                                   Route route = MaterialPageRoute(
//                                       builder: (_) => InvesteDetails());
//                                   Navigator.push(context, route);
//                                 },
//                                 color: Color(0xFFffffff),
//                                 textColor: Color(0xFF1AB6DC),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4.w),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
//                           child: Container(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset("assets/icons/rhombus.svg"),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: [
//                                     SvgPicture.asset(
//                                         "assets/icons/rhombus.svg"),
//                                     SizedBox(width: 4.w),
//                                     SvgPicture.asset(
//                                         "assets/icons/rhombus.svg"),
//                                   ],
//                                 ),
//                                 SvgPicture.asset("assets/icons/rhombus.svg"),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 Text(
//                   "Earn up to 20% returns on your investments with 02.",
//                   style: TextStyle(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: "Muli",
//                     color: Color(0xFF999999),
//                   ),
//                 ),
//                 SizedBox(height: 2.h),
//                 investmentBox(
//                     "02 Keep",
//                     "Save a certain amount everyday, every week or every month and withdraw at the end of the month or year. Plan starts from NGN 1",
//                     "Lock away a certain amount of money for a month.",
//                     "Earn up to 15% interest depending on the initial capital",
//                     "Choose 02 Keep", () {
//                   Route route = MaterialPageRoute(builder: (_) => Keep2());
//                   Navigator.push(context, route);
//                 }),
//                 SizedBox(height: 3.h),
//                 investmentBox(
//                     "02 Lockup",
//                     "Lock funds away for a time period which is between 6 months and 1 year and get massive interests immediately. Plan starts from NGN 1000",
//                     "Invest up and earn your interest immediately",
//                     "Earn 30% return on investment on your initial capital",
//                     "Choose 02 Lockup", () {
//                   Route route = MaterialPageRoute(builder: (_) => Lock2());
//                   Navigator.push(context, route);
//                 }),
//                 SizedBox(height: 2.h),
//                 investmentBox(
//                     "02 Fix",
//                     "Save a certain amount everyday, every week or every month and withdraw at the end of the month or year. Plan starts from NGN 1",
//                     "Lock away a certain amount of money for a month.",
//                     "Earn up to 15% interest depending on the initial capital",
//                     "Choose 02 Fix", () {
//                   Route route = MaterialPageRoute(builder: (_) => Fix2());
//                   Navigator.push(context, route);
//                 }),
//                 SizedBox(height: 3.h),
//                 investmentBox(
//                     "02 Project",
//                     "Choose from our projects and invest in them. Projects can be 02 Realtor, 02 Farms, 02 Oil and Gas. Plan starts from NGN 100,000",
//                     "Chooose one or more plans of your preference",
//                     "Chooose one or more plans of your preference",
//                     "Choose 02 Project", () {
//                   Route route = MaterialPageRoute(builder: (_) => Product2());
//                   Navigator.push(context, route);
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget investmentBox(String title, String desc, String feature1,
//       String feature2, String btnText, VoidCallback callback) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: EdgeInsets.all(3.w),
//               decoration: BoxDecoration(
//                   color: Color(0xFF1AB6DC), shape: BoxShape.circle),
//               child: SvgPicture.asset("assets/icons/keep.svg"),
//             ),
//             SizedBox(width: 3.w),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: "Muli",
//                 color: Color(0xFF05242C),
//               ),
//             ),
//             SizedBox(height: 2.h),
//           ],
//         ),
//         SizedBox(height: 2.h),
//         Text(
//           desc,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontFamily: "Muli",
//             color: Color(0xFF4F4F4F),
//           ),
//         ),
//         SizedBox(height: 2.h),
//         Text(
//           "Features",
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontWeight: FontWeight.w700,
//             fontFamily: "Muli",
//             color: Color(0xFF05242C),
//           ),
//         ),
//         SizedBox(height: 1.h),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SvgPicture.asset("assets/icons/tickCircle.svg"),
//             SizedBox(width: 3.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     feature1,
//                     style: TextStyle(
//                       fontSize: 11.sp,
//                       fontFamily: "Muli",
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 2.h),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SvgPicture.asset("assets/icons/tickCircle.svg"),
//             SizedBox(width: 2.w),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     feature2,
//                     style: TextStyle(
//                       fontSize: 11.sp,
//                       fontFamily: "Muli",
//                       color: Color(0xFF999999),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         InkWell(
//           onTap: callback,
//           child: Container(
//             height: 8.h,
//             margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4.w),
//                 color: oxygenPrimaryColor),
//             child: Center(
//               child: Text(
//                 btnText,
//                 style: TextStyle(fontSize: 12.sp, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   getDetails() async {
//     String? userID = OxygenApp.sharedPreferences!.getString(OxygenApp.userUID);

//     var userDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();
//     setState(() {
//       investmentBalance = userDetails["investment"].toString();
//     });
//   }
// }
