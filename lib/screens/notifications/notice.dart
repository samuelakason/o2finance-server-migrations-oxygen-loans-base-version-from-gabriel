import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/dashboard_controller/notifications.dart';
import 'package:oxygen_loans/providers/theme.dart';
import 'package:oxygen_loans/screens/notifications/widgets/notification_box.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Notice extends StatelessWidget {
  Notice({Key? key}) : super(key: key);
  final ctrl = Get.put(AppNotificiationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2(
        "Notifications",
        notificationScreen: true,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<AppNotificiationController>(initState: (controller) {
          ctrl.getNotifications();
        }, builder: (controller) {
          return Container(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  controller.loadingNotofications
                      ? SafeArea(child: MainShimmer())
                      : SizedBox(
                          height: 80.h,
                          child: controller.notificationModeHistory.data.isEmpty
                              ? EmptyState(desc: "No notifications yet")
                              : SizedBox(
                                  height: 90.h,
                                  child: ListView.builder(
                                    // shrinkWrap: true,
                                    // physics: const AlwaysScrollableScrollPhysics(),
                                    itemCount: controller
                                        .notificationModeHistory.data.length,

                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data = controller
                                          .notificationModeHistory.data[index];
                                      return NotificationBox(
                                        text: data.notificationMsg!,
                                        time: DateFormat('d MMMM, yyyy')
                                            .format(data.notificationEntry!),
                                      );
                                      // InkWell(
                                      //     onTap: () {
                                      //       // controller.selectedLoan = data;
                                      //       // Get.to(() => LoanDetail(),
                                      //       //     duration: const Duration(milliseconds: 1000),
                                      //       //     transition: Transition.rightToLeft);
                                      //     },
                                      //     child: NotificationBox(text: data, time: time));
                                    },
                                  ),
                                ),
                        ),
                ],
              ));
        }),
      ),
    );
  }
}
