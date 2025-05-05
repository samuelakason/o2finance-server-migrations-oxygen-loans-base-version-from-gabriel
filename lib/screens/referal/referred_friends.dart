import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/referral.dart';
import 'package:oxygen_loans/screens/loans/loans.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:sizer/sizer.dart';

class ReferredFriends extends StatelessWidget {
  ReferredFriends({Key? key}) : super(key: key);
  String userId =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferralController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
              appBar: MyAppBar2("Referred Friends"),
              body: Container(
                padding: EdgeInsets.all(4.w),
                child: controller.loadingReferrals
                    ? MainShimmer()
                    : SizedBox(
                        height: 80.h,
                        child: controller.referralHistoryModel.data.isEmpty
                            ? EmptyState(desc: "No referrals")
                            : ListView.builder(
                                // shrinkWrap: true,
                                // physics: const AlwaysScrollableScrollPhysics(),
                                itemCount:
                                    controller.referralHistoryModel.data.length,

                                itemBuilder: (BuildContext context, int index) {
                                  var data = controller
                                      .referralHistoryModel.data[index];
                                  return InkWell(
                                      onTap: () {
                                        // controller.selectedLoan = data;
                                        // Get.to(() => LoanDetail(),
                                        //     duration: const Duration(milliseconds: 1000),
                                        //     transition: Transition.rightToLeft);
                                      },
                                      child: LoanHistoryBox(
                                        amount: data.referredName!,
                                        status: data.referredCommission!,
                                        ref: "",
                                        date: OxygenApp.timeFormat2
                                            .format(data.referredDated!),
                                      ));
                                },
                              ),
                      ),
              ));
        });
  }
}

class ReferBoxFriends extends StatelessWidget {
  const ReferBoxFriends(
      {Key? key, required this.title, required this.time, required this.icon})
      : super(key: key);
  final String title, time;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        color: oxygenPrimaryColor, shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF093D49),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text("")
            ],
          ),
          SizedBox(height: 2.h),
          Divider(color: Colors.grey),
          SizedBox(height: 2.h)
        ],
      ),
    );
  }
}
