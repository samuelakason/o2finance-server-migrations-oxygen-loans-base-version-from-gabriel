import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/models/loan/profile_update.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class UpdateProfileController extends GetxController {
  File? imageFile;
  bool isUploadingAvatar = false;
  bool selectedNewImage = false;
  bool isUpdatingprofile = false;
  final String baseUrl = OxygenApp.baseUrl;
  String? avatarUrl =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userAvatarUrl);
  final picker = ImagePicker();
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController firstNameTextEditingController =
      TextEditingController(
          text: OxygenApp.sharedPreferences!.getString(OxygenApp.firstName)!);
  final TextEditingController lastNameTextEditingController =
      TextEditingController(
          text: OxygenApp.sharedPreferences!.getString(OxygenApp.lastName)!);
  final TextEditingController emailTextEditingController =
      TextEditingController(
          text: OxygenApp.sharedPreferences!.getString(OxygenApp.email)!);
  final TextEditingController phoneNumberTextEditingController =
      TextEditingController(
          text: OxygenApp.sharedPreferences!.getString(OxygenApp.phoneNumber)!);
  String selectedImagePath = '';
  Future<void> selectAndPickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      print("......not null");
      imageFile = File(pickedFile.path);
      selectedImagePath = pickedFile.path;
      update();
      // uploadImage();
    }
  }

  updateUserDetails() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);

    String userToken =
        OxygenApp.sharedPreferences!.getString(OxygenApp.userToken)!;
    try {
      var request = http.MultipartRequest(
          "POST", Uri.parse("${baseUrl}api/v1/user/more/profile/update"));
      if (selectedImagePath != '') {
        final mimeTypeData =
            lookupMimeType(selectedImagePath, headerBytes: [0xFF, 0xD8])!
                .split('/');

        final picture = await http.MultipartFile.fromPath(
            'avatar', selectedImagePath,
            filename: 'image',
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
        request.files.add(picture);
      }

      request.headers['Authorization'] = 'Bearer $userToken';
      request.fields["first_name"] = firstNameTextEditingController.text.trim();
      request.fields["last_name"] = lastNameTextEditingController.text.trim();
      request.fields["phone_number"] =
          phoneNumberTextEditingController.text.trim();
      request.fields["_method"] = "PATCH";

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var result = String.fromCharCodes(responseData);
      print(result);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw result;
      }
      var resultded = ProfileUpdateModel.fromJson(json.decode(result));

      AlertMessages().succesMessage("Success", "Profile has been updated");

      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      await OxygenApp.sharedPreferences!.setString(
          OxygenApp.firstName, firstNameTextEditingController.text.trim());
      await OxygenApp.sharedPreferences!.setString(
          OxygenApp.lastName, lastNameTextEditingController.text.trim());
      await OxygenApp.sharedPreferences!.setString(
          OxygenApp.phoneNumber, phoneNumberTextEditingController.text.trim());
      await OxygenApp.sharedPreferences!
          .setString(OxygenApp.userAvatarUrl, resultded.data!.avatar!);
      update();
    } catch (e) {
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      if (e == FetchDataException) {
        AlertMessages().erroMessage('Network Error!',
            "Please check your internet connection. A network error has occurred");
      } else {
        print(e);
        var responsError = jsonDecode(e.toString());
        AlertMessages().erroMessage('Error!', responsError['message']);
      }
    }
  }
}
