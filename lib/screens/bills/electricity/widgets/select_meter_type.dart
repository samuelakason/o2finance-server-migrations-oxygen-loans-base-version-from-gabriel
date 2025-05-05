import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/bills/electricity.dart';
import 'package:sizer/sizer.dart';

class SelectMeterType extends StatelessWidget {
  const SelectMeterType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricityController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      controller.isPrepaid = true;
                      controller.meterType.text = "Prepaid";

                      controller.update();
                      Navigator.pop(context);
                    },
                    child: MeterTypeBox(
                        title: "Prepaid", isActive: controller.isPrepaid)),
                InkWell(
                    onTap: () {
                      controller.isPrepaid = false;
                      controller.meterType.text = "Postpaid";
                      controller.update();
                      Navigator.pop(context);
                    },
                    child: MeterTypeBox(
                        title: "PostPaid", isActive: !controller.isPrepaid))
              ],
            ),
          );
        });
  }
}

class MeterTypeBox extends StatelessWidget {
  const MeterTypeBox({Key? key, required this.title, required this.isActive})
      : super(key: key);
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Muli",
                    color: Color(0xFF093D49),
                  ),
                ),
              ],
            ),
            isActive
                ? Icon(
                    CupertinoIcons.circle_filled,
                    color: Theme.of(context).primaryColor,
                    size: 12.sp,
                  )
                : Icon(
                    CupertinoIcons.circle,
                    color: Colors.grey,
                    size: 12.sp,
                  )
          ],
        ),
        SizedBox(height: 2.5.h),
        Divider(color: Color(0xFFBDBDBD)),
      ],
    );
  }
}
