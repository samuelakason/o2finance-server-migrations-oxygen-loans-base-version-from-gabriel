import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/cable.dart';
import 'package:oxygen_loans/controllers/bills/data.dart';
import 'package:oxygen_loans/controllers/bills/electricity.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/trans_box.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/dotted_lines.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class LoanSuccess extends StatelessWidget {
  const LoanSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(builder: (controller) {
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          child: SvgPicture.asset(
            "assets/icons/agent.svg",
            height: 25.h,
          ),
        ),
        Container(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              SizedBox(height: 4.h),
              Text(
                "Your loan request is being processed",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black, fontSize: 13.sp),
              ),
              SizedBox(height: 4.h),
              MainButton(
                  title: "OK",
                  callback: () {
                    Get.offAll(() => MainScreen(sIndex: 0),
                        duration: const Duration(milliseconds: 1000),
                        transition: Transition.rightToLeft);
                  })
            ],
          ),
        ),
      ]);
    });
  }
}
