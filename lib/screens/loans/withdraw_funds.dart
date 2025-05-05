import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:oxygen_loans/controllers/loan/withdraw.dart';
import 'package:oxygen_loans/screens/loans/widgets/bank_list_sheet.dart';
import 'package:oxygen_loans/screens/loans/widgets/withdraw_banklist.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class WithdrawFunds extends StatelessWidget {
  WithdrawFunds({Key? key}) : super(key: key);
  final ctrl = Get.put(WithdrawController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Withdraw"),
      body: GetBuilder<WithdrawController>(
          initState: (controller) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    Text(
                      "Enter amount to withdraw",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF040404),
                          ),
                    ),
                    SizedBox(height: 2.h),
                    ItemField(
                        title: "Amount",
                        hint: "Amount",
                        controller: controller.amountCtrl),
                    SizedBox(height: 2.h),
                    // ItemField(
                    //     title: "Acctount Number",
                    //     hint: "Acctount Number",
                    //     controller: controller.acctNo),
                    // SizedBox(height: 2.h),
                    // InkWell(
                    //     onTap: () {
                    //       AppBottomSheet()
                    //           .bottomSheet(WithdrawBankList(), 80.h);
                    //     },
                    //     child: SelectBank(
                    //       title: controller.currentBankName,
                    //       displayChevron: true,
                    //     )),
                    // SizedBox(height: 2.h),
                    // SelectBank(
                    //   title: controller.resolvedAccountName,
                    //   displayChevron: false,
                    // ),
                    SizedBox(height: 5.h),
                    MainButton(
                        title: "Withdraw",
                        callback: () {
                          controller.withdrawFunds();
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class SelectBank extends StatelessWidget {
  const SelectBank(
      {Key? key, required this.title, required this.displayChevron})
      : super(key: key);
  final String title;
  final bool displayChevron;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      height: 6.h,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFD4D4D4)),
          borderRadius: BorderRadius.circular(2.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 9.sp, color: Color(0xFF898989)),
          ),
          Visibility(
            visible: displayChevron,
            child: Icon(
              CupertinoIcons.chevron_down,
              color: Color(0xFF585858),
              size: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}

class ItemField extends StatelessWidget {
  const ItemField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller,
      this.validator,
      this.onSaved})
      : super(key: key);
  final String title, hint;
  final TextEditingController controller;

  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      validator: validator,
      style: TextStyle(color: Colors.black, fontSize: 9.sp),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 0.h),
        labelText: hint,
        labelStyle:
            TextStyle(fontSize: 9.sp, fontFamily: "Muli", color: Colors.grey),
        fillColor: Color(0xFF0f1245),
        border: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(2.w),
          borderSide: const BorderSide(color: Color(0xFFD4D4D4), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD4D4D4), width: 1),
          borderRadius: BorderRadius.circular(2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD4D4D4), width: 1),
          borderRadius: BorderRadius.circular(2.w),
        ),
      ),
    );
  }
}
