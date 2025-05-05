// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/bills/cable.dart';
// import 'package:oxygen_loans/controllers/bills/electricity.dart';
// import 'package:oxygen_loans/screens/bills/electricity/widgets/dotted_lines.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class CableSuccess extends StatelessWidget {
//   const CableSuccess({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CableController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Column(
//             children: [
//               SizedBox(
//                 child: SvgPicture.asset(
//                   "assets/icons/agent.svg",
//                   height: 25.h,
//                 ),
//               ),
//               SizedBox(height: 2.h),
//               Padding(
//                 padding: EdgeInsets.all(4.w),
//                 child: Column(
//                   children: [
//                     TransferRecBox(
//                         title: "Smartcard:", value: controller.smartCardNo),
//                     TransferRecBox(
//                         title: "Cabel Package:",
//                         value: controller.currentData['title']),
//                     TransferRecBox(
//                         title: "Cable provider:",
//                         value: controller.type.toUpperCase()),
//                     TransferRecBox(
//                         title: "Amount",
//                         value: controller.currentData['price']),
//                     TransferRecBox(
//                         title: "Date",
//                         value: OxygenApp.timeFormat.format(DateTime.now())),
//                     SizedBox(height: 2.h),
//                     MainButton(
//                         title: "Close",
//                         callback: () {
//                           Navigator.pop(context);
//                         })
//                   ],
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }

// class TransferRecBox extends StatelessWidget {
//   const TransferRecBox({Key? key, required this.title, required this.value})
//       : super(key: key);
//   final String title;
//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(color: Colors.black, fontSize: 12.sp),
//             ),
//             Text(
//               value,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(color: Colors.black, fontSize: 12.sp),
//             ),
//           ],
//         ),
//         SizedBox(height: 1.5.h),
//         CustomPaint(
//           painter: DottedLinePainter(),
//           size: Size(double.infinity, 1),
//         ),
//         SizedBox(height: 1.5.h),
//       ],
//     );
//   }
// }
