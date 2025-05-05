import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/models/real_estate/real_esatedetail.dart';
import 'package:oxygen_loans/models/real_estate/real_estate.dart';
import 'package:oxygen_loans/repositories/bills.dart';
import 'package:oxygen_loans/repositories/real_estate.dart';
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:oxygen_loans/shared_widgets/alert_messages.dart';
import 'package:oxygen_loans/shared_widgets/loader.dart';

class RealEstateController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRealestate();
  }

  late RealEstateDatum selected;
  late RealEstateDetailModel realEstateDetailModel;
  RealEstateRepository realEstateRepository = RealEstateRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  bool loadingRealEstate = true;
  bool loadingRealEstateDetail = true;
  late RealEstateModel realEstateModel;
  getRealestate() async {
    loadingRealEstate = true;
    update();
    try {
      realEstateModel = await realEstateRepository.getRealEstate();
      loadingRealEstate = false;
      debugPrint(realEstateModel.data.first.propertyCountry.toString());
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingRealEstate = false;
      update();
      if (e == FetchDataException) {
        AlertMessages().erroMessage("Network Error!",
            "Please check your internet connection. A network error has occurred");
      } else {
        var responsError = jsonDecode(e.toString());
        print(responsError);
        AlertMessages().erroMessage("Error!", responsError['message']);
      }
    }
  }

  getRealestateDetail() async {
    loadingRealEstateDetail = true;
    update();
    try {
      realEstateDetailModel = await realEstateRepository
          .getRealEstateDetail(selected.propertyId.toString());
      loadingRealEstateDetail = false;
      debugPrint(realEstateDetailModel.data!.numberOfBathRooms.toString());
      update();
    } catch (e) {
      debugPrint(e.toString());
      loadingRealEstateDetail = false;
      update();
      if (e == FetchDataException) {
        AlertMessages().erroMessage("Network Error!",
            "Please check your internet connection. A network error has occurred");
      } else {
        var responsError = jsonDecode(e.toString());
        print(responsError);
        AlertMessages().erroMessage("Error!", responsError['message']);
      }
    }
  }

  showInterest() async {
    Loadericons().preloader(GlobalContextService.navigatorKey.currentContext!);
    try {
      var response =
          await realEstateRepository.interested(selected.propertyId.toString());
      AlertMessages().succesMessage("Successful", response.message!);
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      update();
    } catch (e) {
      debugPrint(e.toString());
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      if (e == FetchDataException) {
        AlertMessages().erroMessage("Network Error!",
            "Please check your internet connection. A network error has occurred");
      } else {
        var responsError = jsonDecode(e.toString());
        print(responsError);
        AlertMessages().erroMessage("Error!", responsError['message']);
      }
    }
  }
}
