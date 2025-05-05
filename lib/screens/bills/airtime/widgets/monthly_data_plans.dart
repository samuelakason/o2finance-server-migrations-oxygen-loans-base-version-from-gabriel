// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/controllers/bills/airtime.dart';
// import 'package:oxygen_loans/screens/bills/airtime/confirm_payment.dart';
// import 'package:oxygen_loans/screens/bills/airtime/widgets/daily_data_plans.dart';
// import 'package:sizer/sizer.dart';

// class MonthlyDataPlans extends StatelessWidget {
//   const MonthlyDataPlans({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AirtimeController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Column(
//             children: [
//               if (controller.network == "mtn")
//                 Container(
//                   child: controller.mtn_monthly.isNotEmpty
//                       ? SizedBox(
//                           height: 58.h,
//                           child: ListView.builder(
//                               itemCount: controller.mtn_monthly.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                     onTap: () {
//                                       controller.currentData =
//                                           controller.mtn_monthly[index];

//                                       Route route = MaterialPageRoute(
//                                         builder: (_) =>
//                                             ConfirmAirtimePurchase(),
//                                       );
//                                       Navigator.push(context, route);
//                                     },
//                                     child: DataBox(
//                                         title: controller.mtn_monthly[index]
//                                             ['title'],
//                                         amount: controller.mtn_monthly[index]
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
//                                   "MTN Weekly data plans not available at the moment",
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
//                   child: controller.airtel_monthly.isNotEmpty
//                       ? SizedBox(
//                           height: 58.h,
//                           child: ListView.builder(
//                               itemCount: controller.airtel_monthly.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                     onTap: () {
//                                       controller.currentData =
//                                           controller.airtel_monthly[index];
//                                       Route route = MaterialPageRoute(
//                                         builder: (_) =>
//                                             ConfirmAirtimePurchase(),
//                                       );
//                                       Navigator.push(context, route);
//                                     },
//                                     child: DataBox(
//                                         title: controller.airtel_monthly[index]
//                                             ['title'],
//                                         amount: controller.airtel_monthly[index]
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
//                                   "Airtel weekly data plans not available at the moment",
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
//                   child: controller.glo_monthly.isNotEmpty
//                       ? SizedBox(
//                           height: 58.h,
//                           child: ListView.builder(
//                               itemCount: controller.glo_monthly.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                     onTap: () {
//                                       controller.currentData =
//                                           controller.glo_monthly[index];
//                                       Route route = MaterialPageRoute(
//                                         builder: (_) =>
//                                             ConfirmAirtimePurchase(),
//                                       );
//                                       Navigator.push(context, route);
//                                     },
//                                     child: DataBox(
//                                         title: controller.glo_monthly[index]
//                                             ['title'],
//                                         amount: controller.glo_monthly[index]
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
//                                   "Glo Weekly data plans not available at the moment",
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
//                   child: controller.eti_monthly.isNotEmpty
//                       ? SizedBox(
//                           height: 58.h,
//                           child: ListView.builder(
//                               itemCount: controller.eti_monthly.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return InkWell(
//                                     onTap: () {
//                                       controller.currentData =
//                                           controller.eti_monthly[index];
//                                       Route route = MaterialPageRoute(
//                                         builder: (_) =>
//                                             ConfirmAirtimePurchase(),
//                                       );
//                                       Navigator.push(context, route);
//                                     },
//                                     child: DataBox(
//                                         title: controller.eti_monthly[index]
//                                             ['title'],
//                                         amount: controller.eti_monthly[index]
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
//                                   "Etisalat weekly data plans not available at the moment",
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
//                 )
//             ],
//           );
//         });
//   }
// }
