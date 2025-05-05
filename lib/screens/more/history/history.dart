import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/config/oxygen.dart';

import 'package:oxygen_loans/controllers/more/transaction_history.dart';
import 'package:oxygen_loans/screens/loans/loans.dart';
import 'package:oxygen_loans/screens/more/history/history_detail.dart';

import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:sizer/sizer.dart';

class History extends StatelessWidget {
  History({Key? key}) : super(key: key);
  final ctrl = Get.put(TransactionHistoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionHistoryController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Transaction history"),
            body: Container(
                padding: EdgeInsets.all(4.w),
                height: 100.h,
                child: Column(
                  children: [
                    controller.loadingTransactionHistory
                        ? MainShimmer()
                        : SizedBox(
                            height: 80.h,
                            child: controller.transactionHistory.data.isEmpty
                                ? EmptyState(
                                    desc:
                                        "You have not performed any transaction")
                                : ListView.builder(
                                    // shrinkWrap: true,
                                    // physics: const AlwaysScrollableScrollPhysics(),
                                    itemCount: controller
                                        .transactionHistory.data.length,

                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data = controller
                                          .transactionHistory.data[index];
                                      return InkWell(
                                          onTap: () {
                                            controller.selcetdTransaction =
                                                data;
                                            Get.to(
                                                () =>
                                                    TransactionHistoryDetail(),
                                                duration: const Duration(
                                                    milliseconds: 1000),
                                                transition:
                                                    Transition.rightToLeft);
                                          },
                                          child: TransactionHistoryBox(
                                            amount: data.transactionCategory!
                                                .capitalizeFirst!,
                                            status: data.transactionStatus ??
                                                "Failed",
                                            ref: data.transactionDescription!,
                                            date: OxygenApp.timeFormat2
                                                .format(data.transactionDate!),
                                          ));
                                    },
                                  ),
                          ),
                  ],
                )),
          );
        });
  }
}

class TransactionHistoryBox extends StatelessWidget {
  const TransactionHistoryBox(
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
                          : status == "TRANSACTION SUCCESSFUL"
                              ? Colors.greenAccent
                              : Colors.redAccent),
                  child: Text(
                    status.capitalizeFirst!
                        .replaceAll("TRANSACTION ".capitalizeFirst!, "")
                        .capitalizeFirst!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 10.sp,
                        color: status == 'pending'
                            ? Colors.white
                            : status == "TRANSACTION SUCCESSFUL"
                                ? Colors.black
                                : Colors.white),
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
