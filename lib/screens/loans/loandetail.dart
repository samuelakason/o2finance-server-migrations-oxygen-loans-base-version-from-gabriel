import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/controllers/loan/loan_repayment.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class LoanDetail extends StatelessWidget {
  const LoanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Loan detail"),
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
                    controller.selectedLoan.loanedAmount!,
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
                          title: "Amount to pay back",
                          value:
                              controller.selectedLoan.loanDebitBalance ?? "N/A",
                        ),
                        LoanDetailBox(
                          title: "Loan Date",
                          value: controller.selectedLoan.loanedDate == null
                              ? "N/A"
                              : OxygenApp.timeFormat2
                                  .format(controller.selectedLoan.loanedDate!),
                        ),
                        LoanDetailBox(
                          title: "Loan Due Date",
                          value: controller.selectedLoan.loanDueDate == null
                              ? "N/A"
                              : OxygenApp.timeFormat2
                                  .format(controller.selectedLoan.loanDueDate!),
                        ),
                        LoanDetailBox(
                          title: "Loan Reference",
                          value: controller.selectedLoan.loanReference!,
                        ),
                        LoanDetailBox(
                          title: "Loan status",
                          value: controller.selectedLoan.loanStatus!
                              .toString()
                              .capitalizeFirst!,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Visibility(
                    visible: controller.selectedLoan.loanStatus == 'active',
                    child: Visibility(
                      child: MainButton(
                          title: "Payback",
                          callback: () {
                            final ctrl = Get.put(LoanRepaymentController());
                            ctrl.selectedLoan = controller.selectedLoan;
                            ctrl.getPaymentMethods(
                                controller.selectedLoan.loanId.toString());
                          }),
                    ),
                  )
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
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
                color: Color(0xFF18191F)),
          ),
        ],
      ),
    );
  }
}
