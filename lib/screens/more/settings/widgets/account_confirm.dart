import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/more/bank_details.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class AccountConfirm extends StatelessWidget {
  const AccountConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        initState: (controller) {},
        builder: (controller2) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 90.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    //  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      height: 47.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          AccountDisplay(
                              title: "Account name",
                              value: controller2.accountName),
                          Divider(color: Colors.grey),
                          AccountDisplay(
                              title: "Account number",
                              value: controller2.numberCtrl.text.trim()),
                          Divider(color: Colors.grey),
                          AccountDisplay(
                              title: "Bank", value: controller2.currentBank),
                          Divider(color: Colors.grey),
                          SizedBox(height: 4.h),
                          MainButton(
                            title: "Save",
                            callback: () {
                              //  controller2.saveAccountDetails();
                            },
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}

class AccountDisplay extends StatelessWidget {
  const AccountDisplay({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9.sp,
            fontFamily: "Muli",
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: "Muli",
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
