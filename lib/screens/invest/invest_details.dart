// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/invest/invest_details_2.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class InvesteDetails extends StatefulWidget {
//   const InvesteDetails({Key? key}) : super(key: key);

//   @override
//   _InvesteDetailsState createState() => _InvesteDetailsState();
// }

// class _InvesteDetailsState extends State<InvesteDetails>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabController = new TabController(length: 2, vsync: this);
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
//       child: Column(
//         children: [SizedBox(height: 3.h), investBox()],
//       ),
//     );
//   }

//   Widget investBox() {
//     return Container(
//       height: 50.h,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TabBar(
//             unselectedLabelColor: Colors.grey,
//             labelColor: oxygenPrimaryColor,
//             tabs: [
//               Tab(
//                 text: 'Pending',
//               ),
//               Tab(
//                 text: 'Matured',
//               ),
//             ],
//             controller: _tabController,
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicatorColor: oxygenPrimaryColor,
//             indicatorWeight: 1.0,
//           ),
//           SizedBox(height: 3.h),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 Container(
//                   child: pending(),
//                 ),
//                 Container(
//                   child: matured(),
//                 ),
//               ],
//               controller: _tabController,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget pending() {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     return Container(
//       padding: EdgeInsets.only(left: 3.w, right: 3.w),
//       child: StreamBuilder(
//           stream: OxygenApp.firestore
//               .collection('users')
//               .doc(userID)
//               .collection("investements")
//               .where('status', isEqualTo: "0")
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10.h),
//                     SpinKitDoubleBounce(
//                       color: oxygenPrimaryColor,
//                       size: 10.h,
//                     ),
//                   ],
//                 ),
//               );
//             }

//             if (snapshot.data!.docs.length < 1) {
//               return Center(
//                 child: noItems("You dont have any completed loan"),
//               );
//             }

//             return Container(
//               constraints: BoxConstraints(
//                 minHeight: 40.h,
//               ),
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot _card = snapshot.data!.docs[index];

//                   return InkWell(
//                     onTap: () {
//                       Route route = MaterialPageRoute(
//                           builder: (_) => InvesteDetails2(
//                                 invesetID: _card['investmentID'],
//                               ));
//                       Navigator.push(context, route);
//                     },
//                     child: invest(
//                         _card['principal'],
//                         OxygenApp.timeFormat2.format(
//                             DateTime.parse(_card['maturitDate'].toString())),
//                         CupertinoIcons.timelapse),
//                   );
//                 },
//               ),
//             );
//           }),
//     );
//   }

//   Widget matured() {
//     String userID =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//     return Container(
//       padding: EdgeInsets.only(left: 3.w, right: 3.w),
//       child: StreamBuilder(
//           stream: OxygenApp.firestore
//               .collection('users')
//               .doc(userID)
//               .collection("investements")
//               .where('status', isEqualTo: "1")
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 10.h),
//                     SpinKitDoubleBounce(
//                       color: oxygenPrimaryColor,
//                       size: 10.h,
//                     ),
//                   ],
//                 ),
//               );
//             }

//             if (snapshot.data!.docs.length < 1) {
//               return Center(
//                 child: noItems("You dont have any completed loan"),
//               );
//             }

//             return Container(
//               constraints: BoxConstraints(
//                 minHeight: 40.h,
//               ),
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot _card = snapshot.data!.docs[index];

//                   return InkWell(
//                     onTap: () {
//                       print(_card['maturitDate'].toString());
//                       Route route = MaterialPageRoute(
//                           builder: (_) => InvesteDetails2(
//                                 invesetID: _card['investmentID'],
//                               ));
//                       Navigator.push(context, route);
//                     },
//                     child: invest(
//                         _card['principal'],
//                         OxygenApp.timeFormat2.format(
//                             DateTime.parse(_card['maturitDate'].toString())),
//                         CupertinoIcons.check_mark),
//                   );
//                 },
//               ),
//             );
//           }),
//     );
//   }

//   Widget invest(String title, String time, IconData icon) {
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
// }
