import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/screens/loans/request_loan.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class SelectPlan extends StatelessWidget {
  const SelectPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Select Plan"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      // physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller
                          .initialiseLoanModel.data!.paymentPlans.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller
                            .initialiseLoanModel.data!.paymentPlans[index];
                        return InkWell(
                            onTap: () {
                              controller.selectedPlanID =
                                  data.planId.toString();
                              debugPrint(data.planId.toString());
                              Get.to(() => RequestLoan(),
                                  duration: const Duration(milliseconds: 1000),
                                  transition: Transition.rightToLeft);
                            },
                            child: PaymentPlanBox(
                              name: data.planName!,
                              interest: data.planInterestRate!,
                              duration: data.planDuration!,
                              description: data.planDescription!,
                              dueDate: controller.formatDate(
                                  DateTime.parse(data.planDueDate.toString())),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class PaymentPlanBox extends StatelessWidget {
  const PaymentPlanBox(
      {Key? key,
      required this.name,
      required this.interest,
      required this.duration,
      required this.description,
      required this.dueDate})
      : super(key: key);
  final String name, interest, duration, description, dueDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(4.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
              ),
              Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                  child: Icon(
                    CupertinoIcons.chevron_forward,
                    color: Colors.white,
                    size: 12.sp,
                  ))
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            description,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 2.h),
          Text(
            interest + " Interest rate",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 1.h),
          Text(
            duration,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 1.h),
          Text(
            "Due to be repaid on " + dueDate,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
