// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:oxygen_loans/config/color_config.dart';
// import 'package:oxygen_loans/screens/shops/shop_history.dart';
// import 'package:oxygen_loans/screens/shops/shops2.dart';
// import 'package:oxygen_loans/screens/widgets/appbar.dart';
// import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
// import 'package:sizer/sizer.dart';

// class Shops extends StatefulWidget {
//   const Shops({Key? key}) : super(key: key);

//   @override
//   _ShopsState createState() => _ShopsState();
// }

// class _ShopsState extends State<Shops> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar("Shops2"),
//       body: Column(
//         children: [
//           Image.asset(
//             "assets/images/coming.png",
//             height: 40.h,
//           ),
//           Text(
//             'Coming soon....',
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText1!
//                 .copyWith(color: Colors.black, fontSize: 15.sp),
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   backgroundColor: oxygenPrimaryColor,
//       //   onPressed: () {
//       //     Route route = MaterialPageRoute(builder: (_) => ShopHistory());
//       //     Navigator.push(context, route);
//       //   },
//       //   child: Icon(CupertinoIcons.bag),
//       // ),
//     );
//   }

//   Widget getBody() {
//     return SingleChildScrollView(
//       child: Container(
//           padding: EdgeInsets.fromLTRB(8.w, 4.w, 8.w, 4.w),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "02 mall"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("02 mall")),
//                   Container(
//                       height: 10.h,
//                       child: VerticalDivider(color: Colors.black)),
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "Shoprite"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("Shoprite")),
//                 ],
//               ),
//               /*

//               SizedBox(height: 3.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "Market Square"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("Market Square")),
//                   Container(
//                       height: 10.h,
//                       child: VerticalDivider(color: Colors.black)),
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "H-Medix"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("H-Medix")),
//                 ],
//               ),
//               SizedBox(height: 3.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "Game"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("Game")),
//                   Container(
//                       height: 10.h,
//                       child: VerticalDivider(color: Colors.black)),
//                   InkWell(
//                       onTap: () {
//                         Route route = MaterialPageRoute(
//                             builder: (_) => Shops2(shopTitle: "Ebeano"));
//                         Navigator.push(context, route);
//                       },
//                       child: shopBox("Ebeano")),
//                 ],
//               ),
//               SizedBox(height: 3.h),
//               */
//             ],
//           )),
//     );
//   }

//   Widget shopBox(String title) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(4.w),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4.w),
//                 color: oxygenPrimaryColor),
//             child: Container(
//               height: 10.h,
//               width: 20.w,
//               child: Center(
//                 child: Icon(
//                   CupertinoIcons.shopping_cart,
//                   color: Colors.white,
//                   size: 20.sp,
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 12.sp, fontFamily: "Muli", color: Color(0xFF05242C)),
//           ),
//         ],
//       ),
//     );
//   }
// }
