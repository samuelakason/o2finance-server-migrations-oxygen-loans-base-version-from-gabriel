import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/loan/withdraw.dart';
import 'package:oxygen_loans/screens/loans/widgets/search_field.dart';

import 'package:sizer/sizer.dart';

class WithdrawBankList extends StatelessWidget {
  const WithdrawBankList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawController>(
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
                controller.acctNo.text.length >= 10
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
                                      controller.currentBankCode = controller
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
                                padding: EdgeInsets.only(bottom: 4.h),
                                itemCount: controller.bankList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.currentBankIndex = index;
                                      controller.currentBankCode = controller
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
    return Container(
      padding: EdgeInsets.only(left: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: status ? Theme.of(context).primaryColor : Colors.black,
                fontSize: 13.sp),
          ),
          SizedBox(height: 1.5.h),
          Container(
            color: Color(0xFFB0B0B0),
            height: 1,
            width: 100.w,
          ),
          SizedBox(height: 1.5.h),
        ],
      ),
    );
  }
}
