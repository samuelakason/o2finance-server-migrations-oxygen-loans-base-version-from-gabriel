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

class RequestLoan extends StatelessWidget {
  const RequestLoan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Request Loan"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    "Please complete the form below to recieve your loan",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12.sp),
                  ),
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
                  MainTextField(
                      title: "What is this loan for",
                      hint: "What is this loan for",
                      width: 100.w,
                      validator: (value) {
                        return AppFormValidation().validateText(value!);
                      },
                      controller: controller.purposeCtrl,
                      isObscure: false),
                  SizedBox(height: 2.h),
                  MainButton(
                      title: "Proceed",
                      callback: () {
                        controller.requestLoan();
                      })
                ],
              ),
            ),
          );
        });
  }
}
