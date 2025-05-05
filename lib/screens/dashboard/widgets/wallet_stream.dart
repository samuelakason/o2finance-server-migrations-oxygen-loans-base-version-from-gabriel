import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:sizer/sizer.dart';

class WalletStream extends StatelessWidget {
  WalletStream({Key? key, required this.style}) : super(key: key);
  final TextStyle style;
  var formatter = NumberFormat('##,###');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Container();
      // return StreamBuilder(
      //     stream: OxygenApp.firestore
      //         .collection('users')
      //         .where('uid', isEqualTo: controller.userID)
      //         .snapshots(),
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (!snapshot.hasData) {
      //         return Center(
      //           child: Container(
      //             height: 5.h,
      //             child: SpinKitDoubleBounce(
      //               color: Theme.of(context).primaryColor,
      //               size: 2.h,
      //             ),
      //           ),
      //         );
      //       }
      //       if (snapshot.data!.docs.isEmpty) {
      //         return const Center(child: Text('no data'));
      //       }

      //       return Text(
      //         formatter.format(int.parse(
      //             snapshot.data!.docs.first['loan'].round().toString())),
      //         style: style,
      //       );
      //     });
    });
  }
}
