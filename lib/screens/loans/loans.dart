// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/screens/loans/create_guarantors.dart';
import 'package:oxygen_loans/screens/loans/loandetail.dart';
import 'package:oxygen_loans/screens/loans/select_plan.dart';
import 'package:oxygen_loans/screens/loans/verify_bvn.dart';

import 'package:oxygen_loans/screens/widgets/appbar.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class Loans extends StatefulWidget {
  Loans({Key? key}) : super(key: key);

  @override
  _LoansState createState() => _LoansState();
}

class _LoansState extends State<Loans> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String userId =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  bool? isCompleteProfile =
      OxygenApp.sharedPreferences!.getBool(OxygenApp.isCompleteProfile);
  String isLoanActive = "1";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final ctrl = Get.put(LoanUserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar("Loans"),
            body: getBody(),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: oxygenPrimaryColor,
              onPressed: () async {
                if (controller.hasGuarantors == false &&
                    controller.guarantorError == false) {
                  debugPrint("1.....");
                  Get.to(() => CreateGuarantors(),
                      duration: const Duration(milliseconds: 1000),
                      transition: Transition.rightToLeft);
                } else if (controller.hasGuarantors == false &&
                    controller.guarantorError == true) {
                  debugPrint("2.....");
                  controller.getLoanGuarantors(false);
                } else if (controller.hasGuarantors &&
                    controller.guarantorError == false) {
                  debugPrint("3.....");
                  if (controller.verified) {
                    Get.to(() => SelectPlan(),
                        duration: const Duration(milliseconds: 1000),
                        transition: Transition.rightToLeft);
                  } else {
                    Get.to(() => VerifyBvn(),
                        duration: const Duration(milliseconds: 1000),
                        transition: Transition.rightToLeft);
                  }
                } else if (controller.hasGuarantors &&
                    controller.guarantorError == true) {
                  debugPrint("3.....");
                  if (controller.verified) {
                    Get.to(() => SelectPlan(),
                        duration: const Duration(milliseconds: 1000),
                        transition: Transition.rightToLeft);
                  } else {
                    Get.to(() => VerifyBvn(),
                        duration: const Duration(milliseconds: 1000),
                        transition: Transition.rightToLeft);
                  }
                }
              },
              label: Text(
                "Get a Loan",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Muli",
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }

  Widget getBody() {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.loadingLoanHistory
                      ? MainShimmer()
                      : SizedBox(
                          height: 80.h,
                          child: controller.loanHistorytModel.data.isEmpty
                              ? EmptyState(
                                  desc: "You have not applied for loans",
                                  height: 20.h,
                                )
                              : SmartRefresher(
                                  enablePullDown: true,
                                  enablePullUp: false,
                                  onRefresh: () async {
                                    controller.refreshDashboard();
                                  },
                                  header: const WaterDropMaterialHeader(),
                                  controller: controller.refreshController,
                                  child: ListView.builder(
                                    // shrinkWrap: true,
                                    // physics: const AlwaysScrollableScrollPhysics(),
                                    itemCount: controller
                                        .loanHistorytModel.data.length,

                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data = controller
                                          .loanHistorytModel.data[index];
                                      return InkWell(
                                          onTap: () {
                                            debugPrint(data.loanId.toString());
                                            controller.selectedLoan = data;
                                            Get.to(() => LoanDetail(),
                                                duration: const Duration(
                                                    milliseconds: 1000),
                                                transition:
                                                    Transition.rightToLeft);
                                          },
                                          child: LoanHistoryBox(
                                            amount: data.loanedAmount!,
                                            status: data.loanStatus!,
                                            ref: data.loanReference!,
                                            date: data.loanedDate == null
                                                ? ""
                                                : OxygenApp.timeFormat2
                                                    .format(data.loanedDate!),
                                          ));
                                    },
                                  ),
                                ),
                        ),
                ],
              ),
            ),
          );
        });
  }
}

class LoanHistoryBox extends StatelessWidget {
  const LoanHistoryBox(
      {Key? key,
      required this.amount,
      required this.status,
      required this.ref,
      required this.date})
      : super(key: key);
  final String amount, status, ref, date;
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.circular(4.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12.sp),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                width: 40.w,
                child: Text(
                  ref,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 11.sp, color: Colors.grey.withOpacity(1)),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 4.w, right: 4.w, top: 1.w, bottom: 1.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: status == 'pending'
                          ? Colors.grey
                          : Colors.greenAccent),
                  child: Text(
                    status.capitalizeFirst!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10.sp,
                        color:
                            status == 'pending' ? Colors.white : Colors.black),
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp, color: Colors.grey.withOpacity(1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
