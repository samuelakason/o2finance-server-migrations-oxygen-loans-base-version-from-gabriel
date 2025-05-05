import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/update_profile.dart';
import 'package:sizer/sizer.dart';

class AvatarSection extends StatelessWidget {
  const AvatarSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            child: Center(
              child: InkWell(
                onTap: () {
                  controller.selectAndPickImage();
                },
                child: Container(
                  width: 15.h,
                  height: 15.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            controller.imageFile != null
                                ? Container(
                                    width: 15.h,
                                    height: 15.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(controller.imageFile!),
                                      ),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFFBDBDBD),
                                            blurRadius: 5.0,
                                            offset: Offset(0.0, 0.75)),
                                      ],
                                    ),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: OxygenApp.sharedPreferences!
                                        .getString(OxygenApp.userAvatarUrl)
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 15.h,
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 0),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        SpinKitDoubleBounce(
                                            color: Colors.white, size: 15.h),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      width: 15.h,
                                      height: 15.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/black.jpeg"),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xFFBDBDBD),
                                              blurRadius: 5.0,
                                              offset: Offset(0.0, 0.75)),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 1.w, bottom: 2.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            CupertinoIcons.camera_fill,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
