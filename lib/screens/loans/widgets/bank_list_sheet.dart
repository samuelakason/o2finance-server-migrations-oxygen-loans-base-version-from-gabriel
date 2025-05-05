import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/loan/loan.dart';
import 'package:oxygen_loans/screens/loans/widgets/search_field.dart';

import 'package:sizer/sizer.dart';

class BankList extends StatelessWidget {
  const BankList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanUserController>(
        initState: (controller) {},
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Icon(
                  Icons.remove,
                  size: 18.sp,
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: SearchField(
                      onChanged: (value) {
                        if (controller.searchCtrl.text.isNotEmpty) {
                          controller.searchBanks();
                          controller.update();
                          print(value);
                        } else {
                          controller.seaerchedBankList = [];
                          controller.update();
                        }
                      },
                      hint: "Search Banks",
                      controller: controller.searchCtrl),
                ),
                SizedBox(height: 2.h),
                controller.bankAccountCtrl.text.length >= 10
                    ? SizedBox(
                        width: 100.w,
                        height: 75.h,
                        child: controller.searchCtrl.text.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.seaerchedBankList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.currentBankIndex = index;
                                      controller.bankCode = controller
                                          .seaerchedBankList[index].code
                                          .toString();
                                      controller.currentBankName = controller
                                          .seaerchedBankList[index].name!;

                                      controller.update();
                                      Navigator.pop(context);
                                      controller.resolveAccount();
                                    },
                                    child: BankBox(
                                        title: controller
                                            .seaerchedBankList[index].name!,
                                        status: controller.currentBankIndex ==
                                            index),
                                  );
                                })
                            : ListView.builder(
                                itemCount: controller.bankList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.currentBankIndex = index;
                                      controller.bankCode = controller
                                          .bankList[index].code
                                          .toString();
                                      controller.currentBankName =
                                          controller.bankList[index].name!;

                                      controller.update();
                                      Navigator.pop(context);

                                      controller.resolveAccount();
                                    },
                                    child: BankBox(
                                        title: controller.bankList[index].name!,
                                        status: controller.currentBankIndex ==
                                            index),
                                  );
                                }),
                      )
                    : SizedBox()
              ],
            ),
          );
        });
  }
}

class BankBox extends StatelessWidget {
  const BankBox({Key? key, required this.title, required this.status})
      : super(key: key);
  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: status ? Theme.of(context).primaryColor : Colors.black,
                  fontSize: 13.sp),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Container(
          color: Color(0xFFB0B0B0),
          height: 1,
          width: 100.w,
        ),
        SizedBox(height: 1.5.h),
      ],
    );
  }
}
