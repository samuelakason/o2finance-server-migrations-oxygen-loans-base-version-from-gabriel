import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/form_validation.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/screens/loans/widgets/bank_list_sheet.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/text_fields.dart';
import 'package:sizer/sizer.dart';

class VerifyBvn extends StatelessWidget {
  const VerifyBvn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Verify BVN"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    "Please enter your details below so we can verify your details and get you set to apply for instant loans",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 2.h),
                  MainTextField(
                      title: "Bank Account Number",
                      hint: "Bank Account Number",
                      keyboardType: TextInputType.phone,
                      width: 100.w,
                      textInputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return AppFormValidation().validateText(value!);
                      },
                      controller: controller.bankAccountCtrl,
                      isObscure: false),
                  SizedBox(height: 2.h),
                  InkWell(
                      onTap: () {
                        AppBottomSheet().bottomSheet(BankList(), 80.h);
                      },
                      child: BankNameField(title: controller.currentBankName)),
                  SizedBox(height: 2.h),
                  Visibility(
                    visible: controller.resolvedAccountName != '',
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          controller.resolvedAccountName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 12.sp),
                        )),
                  ),
                  SizedBox(height: 2.h),
                  MainButton(
                      title: "Proceed",
                      callback: () {
                        controller.verifyBvn();
                      }),
                  SizedBox(height: 2.h),
                  Text(
                    "All loan withdrawals will be proccessed to this account",
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 10.sp, color: Colors.redAccent),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
