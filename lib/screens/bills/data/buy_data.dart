import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/form_validation.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/data.dart';
import 'package:oxygen_loans/screens/bills/airtime/airtime_confirmation.dart';
import 'package:oxygen_loans/screens/bills/data/widgets/data_confirmation.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/text_fields.dart';
import 'package:sizer/sizer.dart';

class BuyData extends StatelessWidget {
  const BuyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Buy data"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buy ${controller.planName}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2.h),
                  MainTextField(
                      title: "Phone number",
                      hint: "Phone number",
                      keyboardType: TextInputType.phone,
                      width: 100.w,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return AppFormValidation().validateText(value!);
                      },
                      controller: controller.phoneCtrl,
                      isObscure: false),
                  SizedBox(height: 5.h),
                  MainButton(
                      title: "Proceed",
                      callback: () {
                        AppBottomSheet().bottomSheet(DataConfirmatoion(), 60.h);
                      })
                ],
              ),
            ),
          );
        });
  }
}
