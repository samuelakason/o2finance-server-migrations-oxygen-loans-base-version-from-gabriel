import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/cable.dart';
import 'package:oxygen_loans/controllers/bills/electricity.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/trans_box.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/dotted_lines.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class ElectrictyConfirmatoion extends StatelessWidget {
  const ElectrictyConfirmatoion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricityController>(builder: (controller) {
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
              TransferRecBox(
                  title: "Meter number:",
                  value: controller.meterCtrl.text.trim()),
              TransferRecBox(
                  title: "Amount:", value: controller.amountCtrl.text.trim()),
              TransferRecBox(
                  title: "Customer name:",
                  value: controller
                      .electrictyVerificationModel.data!.customerName!),
              TransferRecBox(
                  title: "Customer address:",
                  value: controller.electrictyVerificationModel.data!.address!),
              SizedBox(height: 2.h),
              MainButton(
                  title: "Buy units",
                  callback: () {
                    Navigator.pop(context);
                    controller.buyUnits();
                    //controller.makePurchase();
                  })
            ],
          ),
        ),
      ]);
    });
  }
}
