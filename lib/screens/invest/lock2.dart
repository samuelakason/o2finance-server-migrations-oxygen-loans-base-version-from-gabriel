// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:oxygen_loans/screens/invest/keep3.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// import 'lock3.dart';

// class Lock2 extends StatefulWidget {
//   Lock2({Key? key}) : super(key: key);

//   @override
//   _Lock2State createState() => _Lock2State();
// }

// class _Lock2State extends State<Lock2> {
//   final TextEditingController _amountTextEditingController =
//       TextEditingController();

//   List<String> loanReason = [
//     "Please select",
//     "3 months",
//     "6 months",
//     "9 months",
//     "12 months",
//   ];
//   String currentloanReason = "Please select";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("02 Lock up"),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(4.w),
//           child: Container(
//             child: Column(
//               children: [
//                 authFormField("Investement amount",
//                     _amountTextEditingController, "Investement amount", false),
//                 SizedBox(height: 16),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Text(
//                     "Investment period",
//                     style: TextStyle(
//                         fontSize: 11.sp,
//                         fontFamily: "Muli",
//                         color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 1.h),
//                 FormField<String>(
//                   builder: (FormFieldState<String> state) {
//                     return InputDecorator(
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 2.3.h, vertical: 2.3.h),
//                         fillColor: Color(0xFF0f1245),
//                         border: new OutlineInputBorder(
//                           borderRadius: new BorderRadius.circular(10.0),
//                           borderSide: new BorderSide(
//                               width: 2, color: Color(0xFF025373)),
//                         ),
//                       ),
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton<String>(
//                           value: currentloanReason,
//                           isDense: true,
//                           onChanged: (newValue) {
//                             setState(() {
//                               currentloanReason = newValue!;
//                             });
//                           },
//                           items: loanReason.map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(
//                                 value,
//                                 style: TextStyle(
//                                     color: currentloanReason == "Please select"
//                                         ? Colors.black
//                                         : Colors.black,
//                                     fontSize: SizerUtil.deviceType ==
//                                             DeviceType.mobile
//                                         ? 4.w
//                                         : 3.w),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 60),
//                 Container(
//                   height: 8.h,
//                   margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
//                   width: double.infinity,
//                   child: FlatButton(
//                     child: Text(
//                       "Proceed",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     onPressed: () {
//                       Route route = MaterialPageRoute(
//                           builder: (_) => Lock3(
//                                 investementAmount:
//                                     _amountTextEditingController.text.trim(),
//                                 period: currentloanReason,
//                               ));
//                       Navigator.push(context, route);
//                     },
//                     color: Color(0xFF1AB6DC),
//                     textColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
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
//                 fontSize: 10.sp, fontFamily: "Muli", color: Colors.black),
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
// }
