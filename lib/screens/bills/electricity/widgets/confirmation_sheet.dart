// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/controllers/bills/electricity.dart';
// import 'package:oxygen_loans/screens/bills/electricity/widgets/dotted_lines.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class ElectricVerification extends StatelessWidget {
//   const ElectricVerification({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ElectricityController>(builder: (controller) {
//       return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         SizedBox(
//           child: SvgPicture.asset(
//             "assets/icons/agent.svg",
//             height: 25.h,
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.all(4.w),
//           child: Column(
//             children: [
//               TransferRecBox(
//                   title: "Customer ID:", value: controller.validateCustormerID),
//               TransferRecBox(
//                   title: "Customer name:",
//                   value: controller.validateCustormerName),
//               TransferRecBox(
//                   title: "Customer address:",
//                   value: controller.validateCustormerAddress),
//               TransferRecBox(
//                   title: "Customer arrears:",
//                   value: controller.validateCustormeArrears.toString()),
//               SizedBox(height: 2.h),
//               MainButton(
//                   title: "Proceed",
//                   callback: () {
//                     Navigator.pop(context);
//                     controller.makePurchase();
//                   })
//             ],
//           ),
//         ),
//       ]);
//     });
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
//                   .bodyMedium!
//                   .copyWith(color: Colors.black, fontSize: 13.sp),
//             ),
//             Text(
//               value,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(color: Colors.black, fontSize: 13.sp),
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
