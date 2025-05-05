// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/controllers/bills/airtime.dart';
// import 'package:oxygen_loans/screens/bills/airtime/confirm_payment.dart';
// import 'package:sizer/sizer.dart';

// class DailyDataPlans extends StatelessWidget {
//   const DailyDataPlans({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AirtimeController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Column(
//             children: [
//               if (controller.network == "mtn")
//                 Container(
//                   child: controller.mtn_daily.isNotEmpty
//                       ? ListView.builder(
//                           itemCount: controller.mtn_daily.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return InkWell(
//                                 onTap: () {},
//                                 child: DataBox(
//                                     title: controller.mtn_daily[index]['title'],
//                                     amount: controller.mtn_daily[index]
//                                         ['amount']));
//                           })
//                       : Container(
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 15.h),
//                                 Icon(
//                                   CupertinoIcons.xmark_circle,
//                                   color: Colors.red,
//                                   size: 50.sp,
//                                 ),
//                                 Text(
//                                   "MTN daily data plans not available at the moment",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 15.sp,
//                                     fontFamily: "Muli",
//                                     color: Color(0xFF093D49),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ),
//               if (controller.network == "airtel")
//                 Container(
//                   child: controller.airtel_daily.isNotEmpty
//                       ? SizedBox(
//                           height: 58.h,
//                           child: ListView.builder(
//                               itemCount: controller.airtel_daily.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                     onTap: () {
//                                       controller.currentData =
//                                           controller.airtel_daily[index];
//                                       Route route = MaterialPageRoute(
//                                         builder: (_) =>
//                                             ConfirmAirtimePurchase(),
//                                       );
//                                       Navigator.push(context, route);
//                                     },
//                                     child: DataBox(
//                                         title: controller.airtel_daily[index]
//                                             ['title'],
//                                         amount: controller.airtel_daily[index]
//                                             ['amount']));
//                               }),
//                         )
//                       : Container(
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 15.h),
//                                 Icon(
//                                   CupertinoIcons.xmark_circle,
//                                   color: Colors.red,
//                                   size: 50.sp,
//                                 ),
//                                 Text(
//                                   "Airtel daily data plans not available at the moment",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 15.sp,
//                                     fontFamily: "Muli",
//                                     color: Color(0xFF093D49),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ),
//               if (controller.network == "glo")
//                 Container(
//                   child: controller.glo_daily.isNotEmpty
//                       ? ListView.builder(
//                           itemCount: controller.glo_daily.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return DataBox(
//                                 title: controller.glo_daily[index],
//                                 amount: controller.glo_daily[index]);
//                           })
//                       : Container(
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 15.h),
//                                 Icon(
//                                   CupertinoIcons.xmark_circle,
//                                   color: Colors.red,
//                                   size: 50.sp,
//                                 ),
//                                 Text(
//                                   "Glo daily data plans not available at the moment",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 15.sp,
//                                     fontFamily: "Muli",
//                                     color: Color(0xFF093D49),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ),
//               if (controller.network == "etisalat")
//                 Container(
//                   child: controller.eti_daily.isNotEmpty
//                       ? ListView.builder(
//                           itemCount: controller.eti_daily.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return DataBox(
//                                 title: controller.eti_daily[index],
//                                 amount: controller.eti_daily[index]);
//                           })
//                       : Container(
//                           child: Container(
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 15.h),
//                                 Icon(
//                                   CupertinoIcons.xmark_circle,
//                                   color: Colors.red,
//                                   size: 50.sp,
//                                 ),
//                                 Text(
//                                   "9Mobile daily data plans not available at the moment",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     fontSize: 15.sp,
//                                     fontFamily: "Muli",
//                                     color: Color(0xFF093D49),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ),
//             ],
//           );
//         });
//   }
// }

// class DataBox extends StatelessWidget {
//   const DataBox({Key? key, required this.title, required this.amount})
//       : super(key: key);
//   final String title, amount;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 11.sp,
//                 fontFamily: "Muli",
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               amount,
//               style: TextStyle(
//                 fontSize: 11.sp,
//                 fontFamily: "Muli",
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.h),
//         Divider(
//           color: Colors.black,
//         ),
//         SizedBox(height: 1.h),
//       ],
//     );
//   }
// }
