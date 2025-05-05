import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/payment_card.dart';
import 'package:oxygen_loans/controllers/more/update_profile.dart';
import 'package:oxygen_loans/screens/more/edit_profile_box.dart';
import 'package:oxygen_loans/screens/more/profile/widgets/avatar_section.dart';
import 'package:oxygen_loans/screens/more/profile/widgets/review_box.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class EditProfile2 extends StatelessWidget {
  EditProfile2({Key? key}) : super(key: key);
  final ctrl = Get.put(UpdateProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Edit Profile"),
      body: GetBuilder<UpdateProfileController>(
          initState: (controller) {},
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    AvatarSection(),
                    EditProfileBox(
                        isEditable: true,
                        title: "First Name",
                        ctrl: controller.firstNameTextEditingController),
                    EditProfileBox(
                        isEditable: true,
                        title: "Last Name",
                        ctrl: controller.lastNameTextEditingController),
                    EditProfileBox(
                        isEditable: true,
                        title: "Phone numbers",
                        ctrl: controller.phoneNumberTextEditingController),
                    EditProfileBox(
                        isEditable: false,
                        title: "Email",
                        ctrl: controller.phoneNumberTextEditingController),
                    SizedBox(height: 2.h),
                    MainButton(
                        title: "Save",
                        callback: () {
                          controller.updateUserDetails();
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
