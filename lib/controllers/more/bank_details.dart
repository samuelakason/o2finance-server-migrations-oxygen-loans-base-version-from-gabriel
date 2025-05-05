import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/http_client.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/repositories/paystack.dart';
import 'package:oxygen_loans/screens/more/settings/widgets/account_confirm.dart';
import 'package:oxygen_loans/screens/more/settings/widgets/bank_sheet.dart';
import 'package:oxygen_loans/screens/widgets/form_field1.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:http/http.dart' as http;
import 'package:oxygen_loans/services/app_exceptions.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:sizer/sizer.dart';

class BankDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  PaystackRepository paystackRepository = PaystackRepository(
    userToken: AppHttpClient.getCurentToken(),
    client: AppHttpClient.getHttpClient(),
  );
  Map<String, dynamic> banks = {};
  String userId =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController bankCtrl = TextEditingController();
  final TextEditingController numberCtrl = TextEditingController();
  List<String> banksConfirmed = [
    "Please select",
    "Abbey Mortgage Bank",
    "Access Bank",
    "Access Bank (Diamond)",
    "Bowen Microfinance Bank",
    "Ecobank Nigeria",
    "Fidelity Bank",
    "First City Monument Bank",
    "Heritage Bank",
    "Jaiz Bank",
    "Keystone Bank",
    "Kuda Bank",
    "PalmPay",
    "Polaris Bank",
    "Providus Bank",
    "Stanbic IBTC Bank",
    "Standard Chartered Bank",
    "Union Bank of Nigeria",
    "Unity Bank",
    "Wema Bank",
    "Wema Bank",
    "Zenith bank",
    "UBA",
    "First bank",
    "GTB",
  ];
  List<String> banksCodes = [
    "0",
    "801",
    "044",
    "063",
    "50931",
    "050",
    "070",
    "214",
    "030",
    "301",
    "082",
    "50211",
    "999991",
    "076",
    "101",
    "221",
    "068",
    "032",
    "215",
    "035",
    "035",
    "057",
    "032",
    "011",
    "058",
  ];
  String currentBank = "Please select";
  int bankIndex = 0;
  String accountName = "";
  String accountNumber = "";
  String recCode = "";
  bool foundAccount = false;

  String secretKey = "sk_live_c057dd7b6b02aad6cd89bcd0be1d40abfac4a13b";

  confirmAccount() async {
    foundAccount = false;
    LoadersIcons().preloader(GlobalContextService.navigatorKey.currentContext!);
    String accNo = numberCtrl.text.trim();
    String bankCodeInner = banksCodes[bankIndex];

    try {
      final response =
          await paystackRepository.checkAcct(accNo, bankCodeInner, secretKey);
      foundAccount = true;
      accountName = response!.data.accountName;
      accountNumber = response.data.accountNumber;
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      displayDialog();
      update();
    } on FetchDataException {
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      Get.snackbar('Error!', "Please check your network connection",
          isDismissible: true,
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP,
          colorText: Color(0xFF000000),
          duration: const Duration(seconds: 5));
    } catch (e) {
      Navigator.pop(GlobalContextService.navigatorKey.currentContext!);
      var errorResult = json.decode(e.toString());
      Get.snackbar('Error!', errorResult['message'],
          isDismissible: true,
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP,
          colorText: Color(0xFF000000),
          duration: const Duration(seconds: 5));
    }
  }

  displayDialog() {
    showAnimatedDialog(
        context: GlobalContextService.navigatorKey.currentContext!,
        barrierDismissible: true,
        animationType: DialogTransitionType.slideFromBottom,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return AccountConfirm();
          });
        });
  }

  showModal() {
    showModalBottomSheet(
      context: GlobalContextService.navigatorKey.currentContext!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool accepted = false;
        return BankSheet();
      },
    );
  }

  displayDialog2() {
    showAnimatedDialog(
        context: GlobalContextService.navigatorKey.currentContext!,
        barrierDismissible: true,
        animationType: DialogTransitionType.slideFromBottom,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Row(
                children: [
                  Icon(CupertinoIcons.info, color: Colors.green, size: 20.sp),
                  SizedBox(width: 3.w),
                  Text("Error"),
                ],
              ),
              content: Container(
                height: 20.h,
                child: Column(
                  children: [
                    Text(
                      "Confirmation failed, please ensure the details supplied is correct",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: "Muli",
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: Colors.red),
                        child: Text(
                          "Cancel",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Muli",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        });
  }

  // saveAccountDetails() {
  //   LoadersIcons().preloader(
  //     GlobalContextService.navigatorKey.currentContext!,
  //   );
  //   DocumentReference documentReference =
  //       OxygenApp.firestore.collection("bankDetails").doc();
  //   documentReference.set({
  //     "docId": documentReference.id,
  //     "bankCode": banksCodes[bankIndex],
  //     "userID": userId,
  //     "bank": currentBank,
  //     "accountName": accountName,
  //     "AccountNumber": numberCtrl.text.trim(),
  //     "date": DateTime.now()
  //   }).then((value) {
  //     Navigator.pop(
  //       GlobalContextService.navigatorKey.currentContext!,
  //     );
  //     Navigator.pop(
  //       GlobalContextService.navigatorKey.currentContext!,
  //     );
  //     Navigator.pop(
  //       GlobalContextService.navigatorKey.currentContext!,
  //     );
  //     Fluttertoast.showToast(
  //         msg: " Saved succesfully ",
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   });
  // }

  // deleteBank(String bankDetailsID) {
  //   OxygenApp.firestore
  //       .collection("bankDetails")
  //       .doc(bankDetailsID)
  //       .delete()
  //       .then((value) {
  //     Fluttertoast.showToast(
  //         msg: " Deleted succesfully ",
  //         gravity: ToastGravity.CENTER,
  //         toastLength: Toast.LENGTH_LONG,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   });
  // }
}
