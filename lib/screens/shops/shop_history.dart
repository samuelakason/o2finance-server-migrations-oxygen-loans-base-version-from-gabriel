// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/loans/get_loan.dart';
// import 'package:oxygen_loans/screens/loans/loan_details.dart';
// import 'package:oxygen_loans/screens/loans/loan_permission.dart';
// import 'package:oxygen_loans/screens/loans/user_basic_info.dart';
// import 'package:oxygen_loans/screens/shops/shop_history2.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class ShopHistory extends StatefulWidget {
//   ShopHistory({Key? key}) : super(key: key);

//   @override
//   _ShopHistoryState createState() => _ShopHistoryState();
// }

// class _ShopHistoryState extends State<ShopHistory>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   String userId =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   bool? isCompleteProfile =
//       OxygenApp.sharedPreferences!.getBool(OxygenApp.isCompleteProfile);
//   String isLoanActive = "1";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabController = new TabController(length: 3, vsync: this);
//     getUserDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("Loans"),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0, right: 20),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 2.h),
//               /*
//               Text(
//                 "Apply for a loan with few simple steps, click on the button below to begin",
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   fontFamily: "Muli",
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xFF093D49),
//                 ),
//               ),
//               SizedBox(height: 2.h),
//               Container(
//                 height: 5.h,
//                 margin: EdgeInsets.fromLTRB(0, 0, 0, 28),
//                 width: 40.w,
//                 child: FlatButton(
//                   child: Text(
//                     "Apply",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   onPressed: () {
                    
//                   },
//                   color: Color(0xFF1AB6DC),
//                   textColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(2.w),
//                   ),
//                 ),
//               ),
//               */
//               SizedBox(height: 2.h),
//               loanBox()
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget loanBox() {
//     return Container(
//       height: 100.h,
//       child: DefaultTabController(
//           length: 4,
//           child: Column(
//             children: [
//               TabBar(
//                   isScrollable: true,
//                   unselectedLabelColor: Colors.grey,
//                   indicatorColor: oxygenPrimaryColor,
//                   labelColor: oxygenPrimaryColor,
//                   labelStyle: TextStyle(
//                     fontSize: 11.sp,
//                     fontFamily: "Muli",
//                     color: oxygenPrimaryColor,
//                   ),
//                   unselectedLabelStyle: TextStyle(
//                     fontSize: 11.sp,
//                     fontFamily: "Muli",
//                     color: Colors.grey,
//                   ),
//                   tabs: [
//                     Tab(
//                       text: 'Pending',
//                     ),
//                     Tab(
//                       text: 'Approved',
//                     ),
//                     Tab(
//                       text: 'Completed',
//                     ),
//                     Tab(
//                       text: 'Declined',
//                     )
//                   ]),
//               SizedBox(height: 1.h),
//               Expanded(
//                 child: TabBarView(
//                   children: <Widget>[
//                     Container(
//                       child: pending(),
//                     ),
//                     Container(
//                       child: approved(),
//                     ),
//                     Container(
//                       child: completed(),
//                     ),
//                     Container(
//                       child: declined(),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   Widget pending() {
//     return StreamBuilder(
//         stream: OxygenApp.firestore
//             .collection('shops')
//             .where('status', isEqualTo: "0")
//             .where('userId', isEqualTo: userId)
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
//               child: noItems("You dont have any pending loan"),
//             );
//           }

//           return Container(
//             constraints: BoxConstraints(
//               minHeight: 40.h,
//             ),
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot _card = snapshot.data!.docs[index];

//                 return InkWell(
//                   onTap: () {
//                     Route route = MaterialPageRoute(
//                         builder: (_) => ShopHistory2(
//                               loanID: _card['loanID'],
//                               interestAmount: _card['interest'].toString(),
//                               status: "0",
//                               matDate: _card['maturity'],
//                               loanAmount: _card['amount'],
//                               splitpayment: _card['splitPayment'],
//                               loanPeriod: _card['loanPeriod'],
//                               interestRate: _card['interestRate'],
//                               calPeriod: _card['calculationPeriod'],
//                             ));
//                     Navigator.push(context, route);
//                   },
//                   child: loans(
//                       _card['amount'].toString(),
//                       OxygenApp.timeFormat2.format(_card['date'].toDate()),
//                       CupertinoIcons.timer),
//                 );
//               },
//             ),
//           );
//         });
//   }

//   Widget approved() {
//     return StreamBuilder(
//         stream: OxygenApp.firestore
//             .collection('shops')
//             .where('status', isEqualTo: "1")
//             .where('userId', isEqualTo: userId)
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
//               child: noItems("You dont have any approved loan"),
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
//                   onTap: () {
//                     Route route = MaterialPageRoute(
//                         builder: (_) => ShopHistory2(
//                               loanID: _card['loanID'],
//                               interestAmount: _card['interest'].toString(),
//                               status: "1",
//                               matDate: _card['maturity'],
//                               loanAmount: _card['amount'],
//                               splitpayment: _card['splitPayment'],
//                               loanPeriod: _card['loanPeriod'],
//                               interestRate: _card['interestRate'],
//                               calPeriod: _card['calculationPeriod'],
//                             ));
//                     Navigator.push(context, route);
//                   },
//                   child: loans(
//                       _card['amount'].toString(),
//                       OxygenApp.timeFormat2.format(_card['date'].toDate()),
//                       CupertinoIcons.money_dollar_circle),
//                 );
//               },
//             ),
//           );
//         });
//   }

//   Widget completed() {
//     return StreamBuilder(
//         stream: OxygenApp.firestore
//             .collection('shops')
//             .where('status', isEqualTo: "2")
//             .where('userId', isEqualTo: userId)
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
//               child: noItems("You dont have any completed loan"),
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
//                   onTap: () {
//                     Route route = MaterialPageRoute(
//                         builder: (_) => ShopHistory2(
//                               loanID: _card['loanID'],
//                               interestAmount: _card['interest'].toString(),
//                               status: "2",
//                               matDate: _card['maturity'],
//                               loanAmount: _card['amount'],
//                               splitpayment: _card['splitPayment'],
//                               loanPeriod: _card['loanPeriod'],
//                               interestRate: _card['interestRate'],
//                               calPeriod: _card['calculationPeriod'],
//                             ));
//                     Navigator.push(context, route);
//                   },
//                   child: loans(
//                       _card['amount'].toString(),
//                       OxygenApp.timeFormat2.format(_card['date'].toDate()),
//                       CupertinoIcons.check_mark),
//                 );
//               },
//             ),
//           );
//         });
//   }

//   Widget declined() {
//     return StreamBuilder(
//         stream: OxygenApp.firestore
//             .collection('shops')
//             .where('status', isEqualTo: "3")
//             .where('userId', isEqualTo: userId)
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
//               child: noItems("You dont have any declined loan"),
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
//                   onTap: () {
//                     Route route = MaterialPageRoute(
//                         builder: (_) => ShopHistory2(
//                               loanID: _card['loanID'],
//                               interestAmount: _card['interest'].toString(),
//                               status: "3",
//                               matDate: _card['maturity'],
//                               loanAmount: _card['amount'],
//                               splitpayment: _card['splitPayment'],
//                               loanPeriod: _card['loanPeriod'],
//                               interestRate: _card['interestRate'],
//                               calPeriod: _card['calculationPeriod'],
//                             ));
//                     Navigator.push(context, route);
//                   },
//                   child: loans(
//                       _card['amount'].toString(),
//                       OxygenApp.timeFormat2.format(_card['date'].toDate()),
//                       CupertinoIcons.check_mark),
//                 );
//               },
//             ),
//           );
//         });
//   }

//   Widget loans(String title, String time, IconData icon) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.all(4.w),
//                     decoration: BoxDecoration(
//                         color: oxygenPrimaryColor, shape: BoxShape.circle),
//                     child: Icon(
//                       icon,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(width: 4.w),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF093D49),
//                         ),
//                       ),
//                       SizedBox(height: 1.h),
//                       Text(
//                         time,
//                         style: TextStyle(
//                           fontSize: 11.sp,
//                           fontFamily: "Muli",
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Icon(
//                 CupertinoIcons.chevron_right,
//                 color: Colors.black,
//               ),
//             ],
//           ),
//           SizedBox(height: 2.h),
//           Divider(color: Colors.grey),
//           SizedBox(height: 2.h)
//         ],
//       ),
//     );
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

//   getUserDetails() async {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     var loanDetails =
//         await OxygenApp.firestore.collection('users').doc(userID).get();

//     setState(() {
//       isLoanActive = loanDetails["isLoanActive"].toString();
//     });
//   }
// }
