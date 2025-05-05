import 'dart:async';
import 'dart:convert';

import 'package:badges/badges.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/dashboard_controller/notifications.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';

import 'package:oxygen_loans/controllers/loan/withdraw.dart';
import 'package:oxygen_loans/providers/theme.dart';
import 'package:oxygen_loans/screens/bills/bills.dart';
import 'package:oxygen_loans/screens/bills/data/data_networks.dart';

import 'package:oxygen_loans/screens/dashboard/widgets/dash_content_box.dart';
import 'package:oxygen_loans/screens/dashboard/widgets/notification_badge.dart';
import 'package:oxygen_loans/screens/loans/create_guarantors.dart';
import 'package:oxygen_loans/screens/loans/select_plan.dart';
import 'package:oxygen_loans/screens/loans/verify_bvn.dart';

import 'package:oxygen_loans/screens/loans/withdraw_funds.dart';
import 'package:oxygen_loans/screens/more/agent/agent.dart';
import 'package:oxygen_loans/screens/more/membership/membership.dart';
import 'package:oxygen_loans/screens/more/settings/bank_code.dart';
import 'package:oxygen_loans/screens/notifications/notice.dart';
import 'package:oxygen_loans/screens/referal/referal.dart';
import 'package:oxygen_loans/screens/widgets/dash_appbar.dart';
import 'package:oxygen_loans/services/push_notification_service.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../../controllers/dashboard_controller/dashboard_controller.dart';

class Dashboard extends GetView<DashboardController> {
  Dashboard({Key? key}) : super(key: key);
  final creatPinCtrl = Get.put(DashboardController());
  var formatter = NumberFormat('##,###,000');
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        initState: (controller) {},
        builder: (controller) {
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            onRefresh: () async {
              controller.refreshDashboard();
            },
            header: const WaterDropMaterialHeader(),
            controller: controller.refreshController,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hello " +
                                OxygenApp.sharedPreferences!
                                    .getString(OxygenApp.firstName)
                                    .toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Muli",
                              color: Color(0xFF05242C),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/Sun.svg",
                            height: 6.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // final ctrl =
                                //     Get.put(AppNotificiationController());
                                // ctrl.getTransactionHistory();
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  Route route = MaterialPageRoute(
                                      builder: (_) => Notice());
                                  Navigator.push(context, route);
                                });
                              },
                              child: Obx(() => Align(
                                    alignment: Alignment.topRight,
                                    child: controller.unViewed.value == true
                                        ? NotificationBadge()
                                        : Icon(CupertinoIcons.bell),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Welcome to O2 Finance",
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Muli",
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),

                      SizedBox(
                        height: SizerUtil.deviceType == DeviceType.mobile
                            ? 22.h
                            : 24.h,
                        width: 100.w,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 1.w),
                              height: SizerUtil.deviceType == DeviceType.mobile
                                  ? 25.h
                                  : 27.h,
                              child: Container(
                                height: 25.h,
                                width: 82.w,
                                margin: EdgeInsets.only(right: 2.w),
                                decoration: BoxDecoration(
                                  color: Color(0xFF00AEFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.w)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h, left: 2.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 42.w),
                                                child: Image.asset(
                                                  "assets/images/pq.png",
                                                  height: 16.h,
                                                )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "WALLET BALANCE",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                SizedBox(height: 1.h),
                                                controller.loadingHome
                                                    ? SpinKitThreeBounce(
                                                        color: Colors.white,
                                                        size: 18.sp)
                                                    : Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Row(
                                                          children: [
                                                            //SvgPicture.asset("assets/icons/bNaira.svg"),
                                                            Text(
                                                              controller.wallet,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // DashButton(
                                                    //     title: "Apply for a loan",
                                                    //     callback: () {
                                                    //       Route route =
                                                    //           MaterialPageRoute(
                                                    //               builder: (_) =>
                                                    //                   MainScreen(
                                                    //                     sIndex: 1,
                                                    //                   ));
                                                    //       Navigator.pushReplacement(
                                                    //           context, route);
                                                    //     }),
                                                    // SizedBox(width: 5.w),
                                                    // DashButton(
                                                    //     title: "Apply for a loan",
                                                    //     callback: () async {

                                                    //       //cut
                                                    //     }),
                                                    // SizedBox(width: 2.w),

                                                    DashButton(
                                                        color:
                                                            Color(0xFF00AEFF),
                                                        svg:
                                                            "assets/icons/referral-2-svgrepo-com.svg",
                                                        title: "Withdraw",
                                                        callback: () async {
                                                          Get.delete<
                                                              WithdrawController>();
                                                          Get.to(
                                                              () =>
                                                                  WithdrawFunds(),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          500),
                                                              transition:
                                                                  Transition
                                                                      .downToUp);
                                                          //cut
                                                        }),
                                                    // InkWell(
                                                    //   onTap: () {},
                                                    //   child: Container(
                                                    //     padding: EdgeInsets.only(
                                                    //         left: 5.w, right: 5.w),
                                                    //     height: 4.h,
                                                    //     decoration: BoxDecoration(
                                                    //         borderRadius:
                                                    //             BorderRadius
                                                    //                 .circular(4.w),
                                                    //         color:
                                                    //             Colors.transparent,
                                                    //         border: Border.all(
                                                    //             color:
                                                    //                 Colors.white)),
                                                    //     child: Center(
                                                    //         child: Text(
                                                    //       "Withdraw",
                                                    //       style: Theme.of(context)
                                                    //           .textTheme
                                                    //           .bodyMedium!
                                                    //           .copyWith(
                                                    //               fontSize: 11.sp,
                                                    //               color:
                                                    //                   Colors.white),
                                                    //     )),
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: SizerUtil.deviceType == DeviceType.mobile
                                  ? 25.h
                                  : 30.h,
                              child: Container(
                                height:
                                    SizerUtil.deviceType == DeviceType.mobile
                                        ? 25.h
                                        : 30.h,
                                width: 80.w,
                                margin: EdgeInsets.only(right: 2.w),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF938FD),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.w)),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h, left: 2.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 41.w),
                                                child: Image.asset(
                                                  "assets/images/w.png",
                                                  height: 17.h,
                                                )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "UNPAID LOAN BALANCE",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                ),
                                                SizedBox(height: 1.h),
                                                controller.loadingHome
                                                    ? SpinKitThreeBounce(
                                                        color: Colors.white,
                                                        size: 18.sp)
                                                    : Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Row(
                                                          children: [
                                                            //SvgPicture.asset("assets/icons/bNaira.svg"),
                                                            Text(
                                                              controller.loan,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium!
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          20.sp),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    DashButton(
                                                        color:
                                                            Color(0xFF00AEFF),
                                                        svg:
                                                            "assets/icons/referral-2-svgrepo-com.svg",
                                                        title: "Pay up",
                                                        callback: () {
                                                          Get.offAll(
                                                              () => MainScreen(
                                                                  sIndex: 1),
                                                              duration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          1000),
                                                              transition: Transition
                                                                  .rightToLeft);
                                                        }),
                                                    SizedBox(width: 5.w),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4.h),
                      DashContentBoxes(
                          svg: "assets/icons/bb1.svg",
                          title: "Apply for a loan",
                          desc: "Get a loan today, get credited instantly",
                          color: Colors.grey,
                          callback: () {
                            final loanCtrl = Get.find<LoanUserController>();
                            if (loanCtrl.hasGuarantors == false &&
                                loanCtrl.guarantorError == false) {
                              debugPrint("1.....");
                              Get.to(() => CreateGuarantors(),
                                  duration: const Duration(milliseconds: 1000),
                                  transition: Transition.rightToLeft);
                            } else if (loanCtrl.hasGuarantors == false &&
                                loanCtrl.guarantorError == true) {
                              debugPrint("2.....");
                              loanCtrl.getLoanGuarantors(false);
                            } else if (loanCtrl.hasGuarantors &&
                                loanCtrl.guarantorError == false) {
                              debugPrint("3.....");
                              if (loanCtrl.verified) {
                                Get.to(() => SelectPlan(),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    transition: Transition.rightToLeft);
                              } else {
                                Get.to(() => VerifyBvn(),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    transition: Transition.rightToLeft);
                              }
                            } else if (loanCtrl.hasGuarantors &&
                                loanCtrl.guarantorError == true) {
                              debugPrint("3.....");
                              if (loanCtrl.verified) {
                                Get.to(() => SelectPlan(),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    transition: Transition.rightToLeft);
                              } else {
                                Get.to(() => VerifyBvn(),
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    transition: Transition.rightToLeft);
                              }
                            }
                          },
                          bgColor: Colors.purple),
                      SizedBox(height: 2.h),
                      DashContentBoxes(
                          svg: "assets/icons/bb2.svg",
                          title: "Buy airtime",
                          desc: "MTN, GLO, Airtel, 9Mobile",
                          color: Colors.grey,
                          callback: () {
                            Route route =
                                MaterialPageRoute(builder: (_) => Bills());
                            Navigator.push(context, route);
                          },
                          bgColor: Color(0xFFFA6E08)),
                      SizedBox(height: 2.h),
                      DashContentBoxes(
                          svg: "assets/icons/wifi-svgrepo-com.svg",
                          title: "Buy Data",
                          desc: "MTN, GLO, Airtel, 9Mobile",
                          color: Colors.grey,
                          callback: () {
                            Route route = MaterialPageRoute(
                                builder: (_) => DataNetworkSelect());
                            Navigator.push(context, route);
                          },
                          bgColor: Color(0xFFF971FC)),
                      SizedBox(height: 2.h),
                      // DashContentBoxes(
                      //     icon: CupertinoIcons.umbrella,
                      //     title: "Become an Agent",
                      //     desc: "Apply for loans onbehalf of others",
                      //     color: Colors.grey,
                      //     callback: () {
                      //       Route route = MaterialPageRoute(builder: (_) => Agent());
                      //       Navigator.push(context, route);
                      //     },
                      //     bgColor: Color(0xFF05242C)),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Refer and Earn",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "Muli",
                            color: Color(0xFF05242C),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      DashContentBoxes(
                          svg: "assets/icons/referral-2-svgrepo-com.svg",
                          title: "Get free ₦500",
                          desc: "Start referring",
                          color: Colors.grey,
                          callback: () {
                            Route route =
                                MaterialPageRoute(builder: (_) => Refer());
                            Navigator.push(context, route);
                          },
                          bgColor: Color(0xFF00AFEF)),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class DashButton extends StatelessWidget {
  const DashButton(
      {Key? key,
      required this.title,
      required this.callback,
      required this.svg,
      required this.color})
      : super(key: key);
  final String title, svg;
  final VoidCallback callback;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        height: 4.h,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(3.w),
            color: Colors.transparent),
        child: Center(
            child: Row(
          children: [
            // Container(
            //     padding: EdgeInsets.all(3.w),
            //     decoration: BoxDecoration(shape: BoxShape.circle),
            //     child: SvgPicture.asset(
            //       svg,
            //     )),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize:
                      SizerUtil.deviceType == DeviceType.mobile ? 10.sp : 8.sp,
                  color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}
