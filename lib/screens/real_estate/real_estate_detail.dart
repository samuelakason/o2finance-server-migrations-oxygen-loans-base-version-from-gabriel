import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/controllers/real_estate/real_estate.dart';
import 'package:oxygen_loans/screens/real_estate/widget/interested_dialog.dart';
import 'package:oxygen_loans/shared_widgets/app_bottom_sheet.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/main_shimmer.dart';
import 'package:oxygen_loans/shared_widgets/networ_image_loader.dart';
import 'package:sizer/sizer.dart';

class RealEstateDetail extends StatelessWidget {
  const RealEstateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RealEstateController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            body: controller.loadingRealEstateDetail
                ? SafeArea(
                    child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: MainShimmer(),
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImageLoader(
                              imgUrl:
                                  "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=800",
                              borderRadius: BorderRadius.zero,
                              height: 35.h,
                              width: 100.w,
                              errorWidget: "errorWidget"),
                          SafeArea(
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          child: Icon(
                                            CupertinoIcons.chevron_back,
                                            color: Colors.black,
                                            size: 15.sp,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                  .realEstateDetailModel.data!.propertyTitle!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              controller.realEstateDetailModel.data!
                                  .propertyDescription!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.withOpacity(0.5)),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              controller.realEstateDetailModel.data!
                                      .propertyCity! +
                                  ", " +
                                  controller.realEstateDetailModel.data!
                                      .propertyCountry!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.withOpacity(0.5)),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Cost",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              controller
                                  .realEstateDetailModel.data!.propertyCost!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.withOpacity(0.5)),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "Amenities",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600),
                            ),
                            Text(
                              controller.realEstateDetailModel.data!.amenities!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.withOpacity(0.5)),
                            ),
                            SizedBox(height: 2.h),
                            MainButton(
                                title: "Are you interested?",
                                callback: () {
                                  AppBottomSheet()
                                      .bottomSheet(InterestedDialog(), 30.h);
                                })
                          ],
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
