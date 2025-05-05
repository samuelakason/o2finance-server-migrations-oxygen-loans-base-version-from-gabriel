import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/real_estate/real_estate.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class InterestedDialog extends StatelessWidget {
  const InterestedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealEstateController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                ),
                // SizedBox(height: 4.h),
                //  SvgPicture.asset("assets/images/splash3.png"),
                SizedBox(height: 4.h),
                Text(
                  "Hello, we are glad you are showing interest in this property, agent will reach out to you immediately you complete this request",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400, fontSize: 11.sp),
                ),
                SizedBox(height: 2.h),
                MainButton(
                    title: "Proceed",
                    callback: () {
                      Navigator.pop(context);
                      controller.showInterest();
                    }),
              ],
            ),
          );
        });
  }
}
