import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/loan/loan_repayment.dart';
import 'package:oxygen_loans/controllers/more/payment_card.dart';
import 'package:oxygen_loans/screens/more/payment_cards/payment_cards.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:sizer/sizer.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentCardController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(4.w),
            child: Column(
              children: [
                controller.loadingSavedCards
                    ? MainShimmer()
                    : Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.pop(context);
                              controller.intiCardSave();
                            },
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.plus_circle_fill,
                                    color: Theme.of(context).primaryColor),
                                SizedBox(width: 2.w),
                                Text(
                                  "Add new card",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          SizedBox(
                            height: 47.h,
                            child: controller.savedCardModel.data.isEmpty
                                ? EmptyState(
                                    desc:
                                        "No saved cards, please add a card to proceed")
                                : ListView.builder(
                                    // shrinkWrap: true,
                                    // physics: const AlwaysScrollableScrollPhysics(),
                                    itemCount:
                                        controller.savedCardModel.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data =
                                          controller.savedCardModel.data[index];
                                      return InkWell(
                                          onTap: () {
                                            final ctrl = Get.find<
                                                LoanRepaymentController>();
                                            ctrl.payWithSavedCard(
                                                data.cardId.toString());
                                          },
                                          child: CreditCardBox3(
                                            cardNumber: data.cardNumber!,
                                            expiryDate: data.cardExpiringYear!,
                                            type: data.cardType!,
                                          ));
                                    },
                                  ),
                          ),
                        ],
                      ),
              ],
            ),
          );
        });
  }
}
