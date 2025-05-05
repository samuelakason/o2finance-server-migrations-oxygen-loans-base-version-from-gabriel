import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/real_estate/real_estate.dart';
import 'package:oxygen_loans/screens/real_estate/real_estate_detail.dart';

import 'package:oxygen_loans/screens/widgets/appbar.dart';
import 'package:oxygen_loans/shared_widgets/empty_state.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';

import 'package:oxygen_loans/shared_widgets/networ_image_loader.dart';
import 'package:sizer/sizer.dart';

class RealEstate extends StatelessWidget {
  RealEstate({Key? key}) : super(key: key);
  final ctrl = Get.put(RealEstateController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealEstateController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar("Real Estate"),
            body: Container(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  controller.loadingRealEstate
                      ? SafeArea(child: MainShimmer())
                      : SizedBox(
                          height: 73.h,
                          child: controller.realEstateModel.data.isEmpty
                              ? EmptyState(
                                  desc: "No listings available",
                                  height: 20.h,
                                )
                              : ListView.builder(
                                  // shrinkWrap: true,
                                  // physics: const AlwaysScrollableScrollPhysics(),
                                  itemCount:
                                      controller.realEstateModel.data.length,

                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data =
                                        controller.realEstateModel.data[index];
                                    return InkWell(
                                        onTap: () {
                                          debugPrint(data.propertyThumbnail);
                                          debugPrint(OxygenApp
                                              .sharedPreferences!
                                              .getString(OxygenApp.userToken));
                                          controller.selected = data;
                                          controller.getRealestateDetail();
                                          Get.to(() => RealEstateDetail(),
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                        child: RealEstateBox(
                                            image:
                                                "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=800",
                                            title: data.propertyTitle!,
                                            city: data.propertyCity!,
                                            state: data.propertyCountry!,
                                            category: data.propertyState!));
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

class RealEstateBox extends StatelessWidget {
  const RealEstateBox(
      {Key? key,
      required this.image,
      required this.title,
      required this.city,
      required this.state,
      required this.category})
      : super(key: key);
  final String image, title, city, state, category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImageLoader(
              borderRadius: BorderRadius.circular(4.w),
              imgUrl: image,
              height: 25.h,
              width: 100.w,
              errorWidget: "assets/images/side.png"),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 11.sp),
                      ),
                      SizedBox(width: 1.w),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    city,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 9.sp,
                        ),
                  ),
                ],
              ),
              Text(
                state,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
