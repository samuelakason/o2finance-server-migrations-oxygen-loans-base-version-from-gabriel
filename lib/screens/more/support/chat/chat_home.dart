
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/bubble_type.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/config/oxygen.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class ChatHome extends StatefulWidget {
//   const ChatHome({Key? key}) : super(key: key);

//   @override
//   _ChatHomeState createState() => _ChatHomeState();
// }

// class _ChatHomeState extends State<ChatHome> {
//   final TextEditingController messageCtrl = TextEditingController();
//   String userID =
//       OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
//   bool sending = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar2("Live chat"),
//       body: getBody(),
//     );
//   }

//   Widget getBody() {
//     return Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/chatbg.jpeg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         padding: EdgeInsets.all(4.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [Expanded(child: completed()), typeMessage()],
//         ));
//   }

//   Widget typeMessage() {
//     return Row(
//       children: [
//         Container(
//           width: 75.w,
//           padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(5.w),
//               ),
//               border: Border.all(color: Color(0xFF090808))),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: messageCtrl,
//                   cursorColor: Colors.black,
//                   maxLines: null,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: SizerUtil.deviceType == DeviceType.mobile
//                           ? 4.w
//                           : 3.w),
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       errorBorder: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       contentPadding: EdgeInsets.only(
//                           left: 3.w, bottom: 3.w, top: 3.w, right: 3.w),
//                       hintText: "Message...",
//                       hintStyle:
//                           TextStyle(fontFamily: "Muli", color: Colors.black)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           width: 3.w,
//         ),
//         InkWell(
//           onTap: () {
//             sendMessage();
//           },
//           child: Container(
//             padding: EdgeInsets.all(3.w),
//             decoration: BoxDecoration(
//               color: oxygenPrimaryColor,
//               shape: BoxShape.circle,
//             ),
//             child: sending == false
//                 ? SvgPicture.asset(
//                     "assets/icons/referralsMore.svg",
//                     color: Colors.white,
//                     height: 3.h,
//                     width: 3.h,
//                   )
//                 : SpinKitDoubleBounce(color: Colors.white, size: 3.h),
//           ),
//         ),
//       ],
//     );
//   }

//   Future<bool> chatHeadCheck() async {
//     final result = await OxygenApp.firestore
//         .collection('chatHeads')
//         .where('userID', isEqualTo: userID)
//         .get();
//     return result.docs.isEmpty;
//   }

//   sendMessage() async {
//     String imgUrl = OxygenApp.sharedPreferences!
//         .getString(OxygenApp.userAvatarUrl)
//         .toString();
//     String userName =
//         OxygenApp.sharedPreferences!.getString(OxygenApp.userName).toString();
//     await chatHeadCheck().then((value) {
//       DocumentReference documentReference2 =
//           OxygenApp.firestore.collection("chatHeads").doc(userID);
//       if (value) {
//         documentReference2.set({
//           "chateHeadID": documentReference2.id,
//           "senderImgUrl": imgUrl,
//           "username": userName,
//           "chatHead": documentReference2.id,
//           "lastMessage": messageCtrl.text.trim(),
//           "userID": userID,
//           'unread': true,
//           "date": DateTime.now().add(Duration(days: 0, hours: 0)).toString(),
//         }).then((value) {});
//       } else {
//         documentReference2.update({
//           "lastMessage": messageCtrl.text.trim(),
//           "userID": userID,
//           'unread': true,
//           "date": DateTime.now().add(Duration(days: 0, hours: 0)).toString()
//         }).then((value) {});
//       }
//     });

//     DocumentReference documentReference =
//         OxygenApp.firestore.collection("chatMessages").doc();
//     documentReference.set({
//       "messagedID": documentReference.id,
//       "message": messageCtrl.text.trim(),
//       "sender": userID,
//       "messageSender": userID,
//       "date": DateTime.now().toString(),
//     }).then((value) {
//       messageCtrl.clear();
//     });
//   }

//   Widget completed() {
//     return Container(
//       child: StreamBuilder(
//           stream: OxygenApp.firestore
//               .collection('chatMessages')
//               .where('sender', isEqualTo: userID)
//               .orderBy("date", descending: true)
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
//                 child: noItems("You have not save any account details"),
//               );
//             }

//             return Container(
//               height: 70.h,
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 reverse: true,
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   final DocumentSnapshot _card = snapshot.data!.docs[index];

//                   return _card['messageSender'] == userID
//                       ? ChatBubble(
//                           clipper:
//                               ChatBubbleClipper3(type: BubbleType.sendBubble),
//                           alignment: Alignment.topRight,
//                           margin: EdgeInsets.only(top: 20),
//                           backGroundColor: Colors.blue,
//                           child: Container(
//                             constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width * 0.7,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   _card['message'],
//                                   style: TextStyle(
//                                       fontSize: 12.sp,
//                                       fontFamily: "Muli",
//                                       color: Colors.white),
//                                 ),
//                                 SizedBox(height: 1.h),
//                                 Text(
//                                   OxygenApp.timeFormat3.format(
//                                       DateTime.tryParse(_card['date'])!),
//                                   style: TextStyle(
//                                       fontSize: 9.sp,
//                                       fontFamily: "Muli",
//                                       color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : ChatBubble(
//                           clipper: ChatBubbleClipper3(
//                               type: BubbleType.receiverBubble),
//                           alignment: Alignment.topLeft,
//                           margin: EdgeInsets.only(top: 20),
//                           backGroundColor: Colors.blue,
//                           child: Container(
//                             constraints: BoxConstraints(
//                               maxWidth: MediaQuery.of(context).size.width * 0.7,
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   _card['message'],
//                                   style: TextStyle(
//                                       fontSize: 12.sp,
//                                       fontFamily: "Muli",
//                                       color: Colors.white),
//                                 ),
//                                 SizedBox(height: 1.h),
//                                 Text(
//                                   OxygenApp.timeFormat3.format(
//                                       DateTime.tryParse(_card['date'])!),
//                                   style: TextStyle(
//                                       fontSize: 9.sp,
//                                       fontFamily: "Muli",
//                                       color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                 },
//               ),
//             );
//           }),
//     );
//   }

//   Widget bank(String message, String date) {
//     return Container(
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Color(0xFFf1f0f0),
//               blurRadius: 5.0,
//             ),
//           ],
//         ),
//         child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(5.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       message,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                     Text(
//                       date,
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontFamily: "Muli",
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {},
//                 child: Icon(CupertinoIcons.delete,
//                     color: oxygenPrimaryColor, size: 50.sp),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget noItems(String title) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 5.h),
//         ],
//       ),
//     );
//   }
// }
