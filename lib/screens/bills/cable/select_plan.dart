import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/cable.dart';
import 'package:oxygen_loans/controllers/bills/data.dart';
import 'package:oxygen_loans/screens/bills/airtime/airtime_network_select.dart';
import 'package:oxygen_loans/screens/bills/airtime/buy_airtime.dart';
import 'package:oxygen_loans/screens/bills/cable/buy_cable.dart';
import 'package:oxygen_loans/screens/bills/cable/widgets/cable_confirmation.dart';
import 'package:oxygen_loans/screens/bills/data/buy_data.dart';
//import 'package:oxygen_loans/screens/bills/airtime/airtime_details.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:oxygen_loans/shared_widgets/networ_image_loader.dart';
import 'package:sizer/sizer.dart';

class SelectCablePlan extends StatelessWidget {
  SelectCablePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CableController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Data plans"),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    controller.loadingProoviderVariations
                        ? MainShimmer()
                        : SizedBox(
                            height: 80.h,
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: const AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  controller.cableVariationsModel.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data =
                                    controller.cableVariationsModel.data[index];
                                return InkWell(
                                    onTap: () {
                                      controller.planCost = data.variationCost!;
                                      controller.planName = data.variationName!;
                                      controller.selectedProvider =
                                          data.providerId!;
                                      controller.variationCode =
                                          data.variationCode!;
                                      debugPrint(data.providerId!.toString());
                                      Get.to(() => BuyCable(),
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: DataPlanBox(
                                      title: data.variationName!,
                                      cost: data.variationCost!,
                                    ));
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class DataPlanBox extends StatelessWidget {
  const DataPlanBox({Key? key, required this.title, required this.cost})
      : super(key: key);
  final String title, cost;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF093D49),
              ),
            ),
            Row(
              children: [
                Text(
                  cost,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Muli",
                    color: Color(0xFF093D49),
                  ),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  color: Color(0xFF093D49),
                  size: 15.sp,
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 2.5.h),
        Divider(color: Color(0xFFBDBDBD)),
      ],
    );
  }
}
