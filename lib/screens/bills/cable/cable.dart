import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/cable.dart';
import 'package:oxygen_loans/controllers/bills/data.dart';
import 'package:oxygen_loans/controllers/bills/electricity.dart';
import 'package:oxygen_loans/screens/bills/airtime/airtime_network_select.dart';
import 'package:oxygen_loans/screens/bills/airtime/buy_airtime.dart';
import 'package:oxygen_loans/screens/bills/cable/select_plan.dart';
import 'package:oxygen_loans/screens/bills/data/select_plan.dart';
import 'package:oxygen_loans/screens/bills/electricity/buy_electricty.dart';
//import 'package:oxygen_loans/screens/bills/airtime/airtime_details.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:oxygen_loans/shared_widgets/networ_image_loader.dart';
import 'package:sizer/sizer.dart';

class CableProviders extends StatelessWidget {
  CableProviders({Key? key}) : super(key: key);
  final ctrl = Get.put(CableController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CableController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Cable"),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    controller.loadingProvider
                        ? InkWell(
                            onTap: () {
                              controller.getProviders();
                            },
                            child: MainShimmer())
                        : SizedBox(
                            height: 80.h,
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: const AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  controller.cableProvidersModel.data.length,

                              itemBuilder: (BuildContext context, int index) {
                                var data =
                                    controller.cableProvidersModel.data[index];
                                return InkWell(
                                    onTap: () {
                                      controller.selectedProvider =
                                          data.providerId!;
                                      controller.getProviderVariation();

                                      Get.to(() => SelectCablePlan(),
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: ProviderBox(
                                      title: data.providerName!,
                                      image: data.providerAssetUrl!,
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
