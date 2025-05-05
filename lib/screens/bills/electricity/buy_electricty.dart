import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/form_validation.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/electricity.dart';
import 'package:oxygen_loans/screens/bills/airtime/airtime_confirmation.dart';
import 'package:oxygen_loans/screens/bills/electricity/widgets/select_meter_type.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/text_fields.dart';
import 'package:sizer/sizer.dart';

class BuyElectricty extends StatelessWidget {
  const BuyElectricty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ElectricityController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Buy electricity units"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  MainTextField(
                      title: "Metre number",
                      hint: "Metre number",
                      keyboardType: TextInputType.phone,
                      width: 100.w,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return AppFormValidation().validateText(value!);
                      },
                      controller: controller.meterCtrl,
                      isObscure: false),
                  SizedBox(height: 2.h),
                  MainTextField(
                      title: "Amount",
                      hint: "Amount",
                      keyboardType: TextInputType.phone,
                      width: 100.w,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return AppFormValidation().validateText(value!);
                      },
                      controller: controller.amountCtrl,
                      isObscure: false),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      AppBottomSheet().bottomSheet(SelectMeterType(), 30.h);
                    },
                    child: MainTextField(
                        enabled: false,
                        title: "Meter type",
                        hint: "Meter type",
                        keyboardType: TextInputType.phone,
                        width: 100.w,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.meterType,
                        isObscure: false),
                  ),
                  SizedBox(height: 5.h),
                  MainButton(
                      title: "Proceed",
                      callback: () {
                        controller.verifyMeterDetails();
                      })
                ],
              ),
            ),
          );
        });
  }
}
