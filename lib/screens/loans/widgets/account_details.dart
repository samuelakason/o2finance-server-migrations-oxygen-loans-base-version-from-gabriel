import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:oxygen_loans/controllers/loan/loan_repayment.dart';
import 'package:oxygen_loans/controllers/more/payment_card.dart';
import 'package:oxygen_loans/screens/loans/loandetail.dart';
import 'package:oxygen_loans/screens/loans/widgets/select_card_sheet.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class AccountDetails extends StatelessWidget {
  AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoanRepaymentController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                Text(
                  "Account details",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(93, 95, 204, 0.08),
                        blurRadius: 25.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AccountDetailBox(
                        title: "Bank Name",
                        value:
                            controller.virtualAccountModel.data!.accountBank!,
                      ),
                      AccountDetailBox2(
                        title: "Account number",
                        value:
                            controller.virtualAccountModel.data!.accountNumber!,
                      ),
                      AccountDetailBox(
                        title: "Account name",
                        value:
                            controller.virtualAccountModel.data!.accountName!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class AccountDetailBox2 extends StatelessWidget {
  const AccountDetailBox2({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: const Color.fromRGBO(24, 25, 31, 0.55)),
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value)).then((value) {
                AlertMessages()
                    .succesMessage("Copied", "Account number has been copied");
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      color: Color(0xFF18191F)),
                ),
                SizedBox(width: 3.w),
                SvgPicture.asset("assets/icons/copy-svgrepo-com.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountDetailBox extends StatelessWidget {
  const AccountDetailBox({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 9.sp,
                color: const Color.fromRGBO(24, 25, 31, 0.55)),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 11.sp,
                color: Color(0xFF18191F)),
          ),
        ],
      ),
    );
  }
}
