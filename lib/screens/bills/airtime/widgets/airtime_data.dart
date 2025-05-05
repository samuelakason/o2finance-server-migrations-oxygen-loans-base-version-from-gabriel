// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/controllers/bills/airtime.dart';
// import 'package:oxygen_loans/utils/alert_messages.dart';
// import 'package:sizer/sizer.dart';

// class AirtimeData extends StatelessWidget {
//   const AirtimeData({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AirtimeController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   controller.selectedMode = "airtime";
//                   controller.currentType = "airtime";
//                   controller.update();
//                 },
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(17.w, 5.w, 17.w, 5.w),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: controller.selectedMode == "data"
//                               ? oxygenPrimaryColor
//                               : Colors.grey),
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(3.w),
//                         bottomLeft: Radius.circular(3.w),
//                       ),
//                       color: controller.selectedMode == "airtime"
//                           ? oxygenPrimaryColor
//                           : Colors.white),
//                   child: Text(
//                     "Airtime",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 11.sp,
//                         fontFamily: "Muli",
//                         color: controller.selectedMode == "airtime"
//                             ? Colors.white
//                             : Colors.grey),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (controller.numberTextEditingController.text.isNotEmpty) {
//                     controller.selectedMode = "data";
//                     controller.currentType = "data";
//                     controller.update();
//                     controller.showModal();
//                   } else {
//                     AlertMessages()
//                         .erroMessage("Error", "Please enter phone number");
//                   }
//                 },
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(17.w, 5.w, 17.w, 5.w),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: controller.selectedMode == "data"
//                               ? oxygenPrimaryColor
//                               : Colors.grey),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(3.w),
//                         bottomRight: Radius.circular(3.w),
//                       ),
//                       color: controller.selectedMode == "data"
//                           ? oxygenPrimaryColor
//                           : Colors.white),
//                   child: Text(
//                     "Data",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         fontSize: 11.sp,
//                         fontFamily: "Muli",
//                         color: controller.selectedMode == "data"
//                             ? Colors.white
//                             : Colors.grey),
//                   ),
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }
