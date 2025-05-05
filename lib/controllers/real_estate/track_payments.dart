import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:oxygen_loans/config/oxygen.dart';

class TrackpaymentController extends GetxController {
  String userID =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  String tAmount = "";
  String pAmount = "";
  String pPaid = "0";
  String outStanding = "";
  String noOfPayments = "";
  String purchaseID = "";
  String name = "";
  String desc = "";
  String status = "";
  String location = "";
  String state = "";
  String totalPrice = "";
  String buildingID = "";
  int units = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  // getHouseDetails() async {
  //   var userDetails =
  //       await OxygenApp.firestore.collection('users').doc(userID).get();

  //   //get house details
  //   var houseDetails = await OxygenApp.firestore
  //       .collection('buildingProjects')
  //       .doc(buildingID)
  //       .get();
  //   name = houseDetails["name"].toString();
  //   desc = houseDetails["desc"].toString();
  //   location = houseDetails["location"].toString();
  //   state = houseDetails["state"].toString();
  //   totalPrice = houseDetails["totalPrice"].toString();
  //   units = houseDetails["units"];
  //   status = houseDetails["status"];

  //   var bDetails = await OxygenApp.firestore
  //       .collection('buildingPurchase')
  //       .doc(purchaseID)
  //       .get();
  //   int _tAmount = int.parse(bDetails["totalPrice"].toString());
  //   int _pAMount = 0;
  //   for (int i = 0; i < bDetails["payments"].length; i++) {
  //     _pAMount = _pAMount + int.parse(bDetails["payments"][i].toString());
  //   }
  //   int _outstanding = _tAmount - _pAMount;

  //   var formatter = NumberFormat('##,###,000');
  //   print(formatter.format(16987));
  //   int _pPaid = ((_pAMount / _tAmount) * 100).round();

  //   pPaid = _pPaid.toString();
  //   tAmount = (formatter.format(_tAmount)).toString();
  //   pAmount = (formatter.format(_pAMount)).toString();
  //   noOfPayments = bDetails["payments"].length.toString();
  //   outStanding = (formatter.format(_outstanding)).toString();
  //   print(pPaid);
  //   update();
  // }
}
