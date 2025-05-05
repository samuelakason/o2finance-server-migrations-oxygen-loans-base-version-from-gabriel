import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/screens/bills/airtime/buy_airtime.dart';
//import 'package:oxygen_loans/screens/bills/airtime/airtime_details.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:oxygen_loans/shared_widgets/networ_image_loader.dart';
import 'package:sizer/sizer.dart';

class AirtimeNetworkSelect extends StatelessWidget {
  AirtimeNetworkSelect({Key? key}) : super(key: key);
  final ctrl = Get.put(AirtimeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirtimeController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar2("Airtime"),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  children: [
                    controller.loadingProvider
                        ? MainShimmer()
                        : SizedBox(
                            height: 80.h,
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: const AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  controller.airtimeProvidersModel.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller
                                    .airtimeProvidersModel.data[index];
                                return InkWell(
                                    onTap: () {
                                      controller.selectedProvider =
                                          data.providerId!;
                                      debugPrint(data.providerId!.toString());
                                      Get.to(() => BuyAirTime(),
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

class ProviderBox extends StatelessWidget {
  const ProviderBox({Key? key, required this.title, required this.image})
      : super(key: key);
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CachedNetworkImageLoader(
                    imgUrl: image,
                    borderRadius: BorderRadius.circular(3.w),
                    height: 20.sp,
                    width: 20.sp,
                    errorWidget: "errorWidget"),
                SizedBox(width: 2.w),
                SizedBox(
                  width: 70.w,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF093D49),
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.chevron_right,
              color: Color(0xFF093D49),
              size: 15.sp,
            )
          ],
        ),
        SizedBox(height: 2.5.h),
        Divider(color: Color(0xFFBDBDBD)),
      ],
    );
  }
}
