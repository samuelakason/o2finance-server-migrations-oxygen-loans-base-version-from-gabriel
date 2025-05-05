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

class CreateGuarantors extends StatelessWidget {
  const CreateGuarantors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Request Loan"),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    Text(
                      "Please provide guarantor details to proceed",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(height: 2.h),
                    MainTextField(
                        title: "Name",
                        hint: "Name",
                        width: 100.w,
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.gNameCtrl,
                        isObscure: false),
                    SizedBox(height: 2.h),
                    MainTextField(
                        title: "Email",
                        hint: "Email",
                        width: 100.w,
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.gemailCtrl,
                        isObscure: false),
                    SizedBox(height: 2.h),
                    MainTextField(
                        title: "Phone",
                        hint: "Phone",
                        keyboardType: TextInputType.phone,
                        width: 100.w,
                        textInputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.gphoneCtrl,
                        isObscure: false),
                    SizedBox(height: 2.h),
                    MainTextField(
                        title: "Occupation",
                        hint: "Occupation",
                        width: 100.w,
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.goccupationCtrl,
                        isObscure: false),
                    SizedBox(height: 2.h),
                    MainTextField(
                        title: "Address",
                        hint: "Address",
                        width: 100.w,
                        validator: (value) {
                          return AppFormValidation().validateText(value!);
                        },
                        controller: controller.gaddressCtrl,
                        isObscure: false),
                    SizedBox(height: 5.h),
                    MainButton(
                        title: "Proceed",
                        callback: () {
                          controller.createGuarantor();
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }
}
