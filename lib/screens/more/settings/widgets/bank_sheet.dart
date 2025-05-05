import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/controllers/more/bank_details.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:sizer/sizer.dart';

class BankSheet extends StatelessWidget {
  const BankSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        initState: (controller) {},
        builder: (controller2) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter mystate) {
              return GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true).pop(),
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.001),
                    child: GestureDetector(
                      onTap: () {},
                      child: DraggableScrollableSheet(
                        initialChildSize: 0.65,
                        minChildSize: 0.2,
                        maxChildSize: 0.65,
                        builder: (_, controller) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.w),
                                topRight: Radius.circular(5.w),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/bank.png',
                                    height: 23.h,
                                  ),
                                  SizedBox(height: 6.h),
                                  DecoratedBox(
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: oxygenPrimaryColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.w)),
                                        ),
                                      ),
                                      child: Container(
                                        width: 100.w,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.h, vertical: 2.h),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: controller2.currentBank,
                                            isDense: true,
                                            onChanged: (newValue) {
                                              controller2.currentBank =
                                                  newValue!;
                                              print(controller2.currentBank);
                                              controller2.bankIndex =
                                                  controller2.banksConfirmed
                                                      .indexWhere((element) =>
                                                          element == newValue);
                                              controller2.update();
                                              mystate(() {});
                                            },
                                            items: controller2.banksConfirmed
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: value ==
                                                              'Please select'
                                                          ? Colors.grey
                                                          : Colors.black,
                                                      fontSize: SizerUtil
                                                                  .deviceType ==
                                                              DeviceType.mobile
                                                          ? 4.w
                                                          : 3.w),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )),
                                  SizedBox(height: 3.h),
                                  FormField2(
                                    ctrl: controller2.numberCtrl,
                                    isObscure: false,
                                    hint: "Account number",
                                    validator: (value) {
                                      //return controller.validatePassword(value!);
                                    },
                                    onSaved: (value) {
                                      // controller.password = value!;
                                    },
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller2.confirmAccount();
                                    },
                                    child: Container(
                                      height: 8.h,
                                      margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.w),
                                          color: oxygenPrimaryColor),
                                      child: Center(
                                        child: Text(
                                          "Confirm details",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ));
              ;
            }),
          );
        });
  }
}
