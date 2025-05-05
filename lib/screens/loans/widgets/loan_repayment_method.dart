import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:oxygen_loans/controllers/loan/loan_repayment.dart';
import 'package:oxygen_loans/controllers/more/payment_card.dart';
import 'package:oxygen_loans/screens/loans/widgets/account_details.dart';
import 'package:oxygen_loans/screens/loans/widgets/select_card_sheet.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class LoanRepaymentMethodSheet extends StatelessWidget {
  LoanRepaymentMethodSheet({Key? key}) : super(key: key);
  final ctrl = Get.put(LoanRepaymentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanRepaymentController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                SizedBox(height: 1.h),
                Text(
                  "Select payment method",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.loanPaymentModel.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.loanPaymentModel.data;
                      return InkWell(
                          onTap: () {
                            if (data[index] == 'card') {
                              final ctrl = Get.put(PaymentCardController());
                              Navigator.pop(context);
                              AppBottomSheet().bottomSheet(SelectCard(), 60.h);
                            } else if (data[index] == 'bank') {
                              Navigator.pop(context);

                              controller.getBankDetails(
                                  controller.selectedLoan.loanId.toString());
                            }
                          },
                          child: LoanPaymentMethod(
                            title: data[index].capitalizeFirst!,
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class LoanPaymentMethod extends StatelessWidget {
  const LoanPaymentMethod({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.5.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor.withOpacity(0.1)),
                child: SvgPicture.asset(
                  title == 'Bank'
                      ? "assets/icons/mybank.svg"
                      : "assets/icons/bb2.svg",
                  color: Theme.of(context).primaryColor,
                  height: 15.sp,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(height: 2.5.h),
          Container(
            color: Colors.grey.withOpacity(0.2),
            height: 1,
          )
        ],
      ),
    );
  }
}
