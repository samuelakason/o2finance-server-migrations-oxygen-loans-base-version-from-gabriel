import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/controllers/loan/loan_repayment.dart';
import 'package:oxygen_loans/controllers/more/transaction_history.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class TransactionHistoryDetail extends StatelessWidget {
  const TransactionHistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionHistoryController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Transaction Detail"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      width: 20.w,
                      height: 15.h,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/naira.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 2.h),
                  Text(
                    controller.selcetdTransaction.transactionAmount!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(93, 95, 204, 0.08),
                          blurRadius: 25.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        LoanDetailBox(
                          title: "Amount",
                          value:
                              controller.selcetdTransaction.transactionAmount ??
                                  "N/A",
                        ),
                        LoanDetailBox(
                          title: "Category",
                          value: controller
                                  .selcetdTransaction.transactionCategory
                                  .toString()
                                  .capitalizeFirst ??
                              "N/A",
                        ),
                        LoanDetailBox(
                          title: "Status",
                          value: controller.selcetdTransaction.transactionStatus
                                  .toString()
                                  .capitalizeFirst ??
                              "N/A",
                        ),
                        LoanDetailBox(
                            title: "Description",
                            value: controller.selcetdTransaction
                                    .transactionDescription ??
                                "N/A"),
                        LoanDetailBox(
                          title: "Date",
                          value:
                              controller.selcetdTransaction.transactionDate ==
                                      null
                                  ? "N/A"
                                  : OxygenApp.timeFormat2.format(controller
                                      .selcetdTransaction.transactionDate!),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          );
        });
  }
}

class LoanDetailBox extends StatelessWidget {
  const LoanDetailBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: const Color.fromRGBO(24, 25, 31, 0.55)),
          ),
          SizedBox(
            width: 60.w,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: Color(0xFF18191F)),
            ),
          ),
        ],
      ),
    );
  }
}
