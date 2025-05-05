import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:oxygen_loans/controllers/more/payment_card.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:sizer/sizer.dart';

class PaymentCards extends StatelessWidget {
  PaymentCards({Key? key}) : super(key: key);
  final ctrl = Get.put(PaymentCardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentCardController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            floatingActionButton: Container(
              margin: EdgeInsets.only(bottom: 5.h),
              width: 56.0,
              height: 56.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 29.0,
                    offset: Offset(1.0, 4.0),
                  ),
                ],
              ),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  controller.intiCardSave();
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            appBar: MyAppBar2("Payment cards"),
            body: Padding(
              padding: EdgeInsets.all(4.w),
              child: controller.loadingSavedCards
                  ? MainShimmer()
                  : Column(
                      children: [
                        controller.savedCardModel.data.isEmpty
                            ? EmptyState(desc: "You have not saved any card")
                            : SizedBox(
                                height: 80.h,
                                child: ListView.builder(
                                  // shrinkWrap: true,
                                  // physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount:
                                      controller.savedCardModel.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data =
                                        controller.savedCardModel.data[index];
                                    return InkWell(
                                        onTap: () {},
                                        child: CreditCardBox2(
                                          callback: () {
                                            controller.deleteCard(
                                                data.cardId.toString());
                                          },
                                          cardNumber: data.cardNumber!,
                                          expiryDate: data.cardExpiringYear!,
                                          type: data.cardType!,
                                        ));
                                  },
                                ),
                              ),
                      ],
                    ),
            ),
          );
        });
  }
}

class CreditCardBox2 extends StatelessWidget {
  const CreditCardBox2(
      {Key? key,
      required this.cardNumber,
      required this.expiryDate,
      required this.type,
      required this.callback})
      : super(key: key);
  final String cardNumber, expiryDate, type;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.fromLTRB(3.w, 1.w, 3.w, 1.w),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFECEAE8),
          ),
          borderRadius: BorderRadius.circular(4.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      //  color: Theme.of(context).primaryColor.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: SvgPicture.asset(
                    type == 'mastercard'
                        ? 'assets/icons/master.svg'
                        : type == 'visa'
                            ? 'assets/icons/visa11.svg'
                            : 'assets/icons/verve.svg',
                    height: 3.h,
                  )),
              SizedBox(width: 2.w),
              Text(
                cardNumber,
                style: TextStyle(
                    color: Color(0xFF413B35),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          InkWell(
            onTap: callback,
            child: Container(
              padding:
                  EdgeInsets.only(left: 4.w, right: 4.w, top: 3.w, bottom: 3.w),
              decoration: BoxDecoration(
                  color: Color(0xFFFEF3F2),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.delete,
                    size: 11.sp,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    "Delete",
                    style: TextStyle(
                        color: Color(0xFFF04438),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CreditCardBox3 extends StatelessWidget {
  const CreditCardBox3({
    Key? key,
    required this.cardNumber,
    required this.expiryDate,
    required this.type,
  }) : super(key: key);
  final String cardNumber, expiryDate, type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.fromLTRB(3.w, 1.w, 3.w, 1.w),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFECEAE8),
          ),
          borderRadius: BorderRadius.circular(4.w)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                      //  color: Theme.of(context).primaryColor.withOpacity(0.09),
                      borderRadius: BorderRadius.circular(2.w)),
                  child: SvgPicture.asset(
                    type == 'mastercard'
                        ? 'assets/icons/master.svg'
                        : type == 'visa'
                            ? 'assets/icons/visa11.svg'
                            : 'assets/icons/verve.svg',
                    height: 3.h,
                  )),
              SizedBox(width: 2.w),
              Text(
                cardNumber,
                style: TextStyle(
                    color: Color(0xFF413B35),
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Container(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 3.w, bottom: 3.w),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.04),
                shape: BoxShape.circle),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.chevron_forward,
                  size: 11.sp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
