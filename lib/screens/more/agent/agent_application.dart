// import 'dart:ffi';


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:oxygen_loans/bottom_nav_layout.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/form_validation.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/controllers/agents/agent_application.dart';
// import 'package:oxygen_loans/screens/more/more.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:oxygen_loans/screens/widgets/form_field1.dart';
// import 'package:oxygen_loans/screens/widgets/loaders.dart';
// import 'package:oxygen_loans/shared_widgets/buttons.dart';
// import 'package:sizer/sizer.dart';

// class AgentApplication extends StatelessWidget {
//   AgentApplication({Key? key}) : super(key: key);
//   final ctrl = Get.put(AgentApplicationController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AgentApplicationController>(
//         initState: (controller) {},
//         builder: (controller) {
//           return Scaffold(
//             appBar: MyAppBar2("Agent Application"),
//             body: SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.all(4.w),
//                 child: Column(
//                   children: [
//                     Text(
//                       "02 loan agents are affiliates of 02 International limited and our agreement with partners is a binding legal agreement, 02 loans can decide to take legal actions against individuals that violate this agreement. 02 loans retains the right either to approve, disapprove or terminate any agent account that violates our terms and conditions",
//                       style: TextStyle(
//                         fontSize: 11.sp,
//                         fontFamily: "Muli",
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(height: 2.h),
//                     FormField2(
//                       ctrl: controller.locationCtrl,
//                       isObscure: false,
//                       hint: "Your location",
//                       validator: (value) {
//                         return AppFormValidation().validateText(value!);
//                       },
//                       onSaved: (value) {
//                         //controller.address = value!;
//                       },
//                     ),
//                     SizedBox(height: 2.h),
//                     FormField3(
//                       ctrl: controller.loanCustomersCtrl,
//                       isObscure: false,
//                       hint: "Tell us how you intend to draw customers",
//                       validator: (value) {
//                         return AppFormValidation().validateText(value!);
//                       },
//                       onSaved: (value) {
//                         //controller.address = value!;
//                       },
//                     ),
//                     SizedBox(height: 2.h),
//                     MainButton(
//                       title: "Send Application",
//                       callback: () {
//                         controller.sendApplication();
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
