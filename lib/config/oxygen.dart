import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OxygenApp {
  static const String appName = 'AMO Mentorship';
  static DateFormat timeFormat = DateFormat('E, h:mm a');
  static DateFormat timeFormat2 = DateFormat('MMMM d, yyyy');
  static DateFormat timeFormat3 = DateFormat('MMM d');
  static SharedPreferences? sharedPreferences;
  static const String userToken = 'userToken';
  //user details
  static const String isLoggedIn = 'isLoggedIn';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String userName = 'userName';

  static const String email = 'email';
  static const String phoneNumber = 'phoneNumber';
  static const String dob = 'dob';
  static const String bvn = 'bvn';
  static const String userUID = 'userUID';
  static const String localPin = 'localPin';
  static const String userAvatarUrl = 'userAvatarUrl';
  static const String houseAddress = 'houseAddress';
  static const String bankName = 'bankName';
  static const String accountNumber = 'accountNumber';
  static const String loanAmount = 'loanAmount';
  static const String loanReason = 'loanReason';
  static const String idType = 'idType';
  static const String idNumber = 'idNumber';
  static const String permissionGiven = 'permissionGiven';
  static const String isCompleteProfile = 'isCompleteProfile';
  static const String isLoanActive = 'isLoanActive';
  static const String isShopActive = 'isShopActive';
  static const String oneTime = 'oneTime';
  static const String isAgent = 'isAgent';
  static const String referrer = 'referrer';
  static const String firstLoanTaken = 'firstLoanTaken';
  static const String firstShopTaken = 'firstShopTaken';
  static const String isMember = 'isMember';
  static const String accNumber = 'accNumber';
  static const String userBankCode = 'userBankCode';
  static const String fcmToken = 'fcmToken';
  static const String userLat = 'userLat';
  static const String userLong = 'fcuserLongmToken';

  //guarantor
  static const String guarantorName = 'guarantorName';
  static const String guarantorAddress = 'guarantorAddress';
  static const String guarantorPhoneNumber = 'guarantorPhoneNumber';

  //employment
  static const String emplymentStatus = 'emplymentStatus';
  static const String incomeFrequency = 'incomeFrequency';
  static const String incomeValue = 'incomeValue';
  static const String payDay = 'payDay';

  //family
  static const String familyname1 = 'familyname1';
  static const String familyNumber1 = 'familyNumber1';
  static const String familyRelationship1 = 'familyRelationship1';

  static const String familyname2 = 'familyname2';
  static const String familyNumber2 = 'familyNumber2';
  static const String familyRelationship2 = 'familyRelationship2';

  //payments
  static const String utilityMeterNo = 'utilityMeterNo';
  static const String utilityAmountTopay = 'utilityAmountTopay';

  static const String addressID = 'addressID';
  static const String totalAmount = 'totalAmount';
  static const String productID = 'productIDs';
  static const String paymentDetails = 'paymentDetails';
  static const String orderTime = 'orderTime';
  static const String isSuccess = 'isSuccess';

  static const String screenChecker = 'screenChecker';
  static const String currentScreen = 'currentScreen';
  static const String lastSeen = 'lastSeen';
  static const String unread = 'unread';

  //card details
  static const String firstSet = 'firstSet';
  static const String secondSet = 'secondSet';
  static const String thirdSet = 'thirdSet';
  static const String fourthSet = 'fourthSet';

  //user details
  static const String agentLoanFor = 'agentLoanFor';
  static const String agentLoanAmount = 'agentLoanAmount';

  static const String version = 'version';
  static const String brokenImage = "";
  static const String refCode = "";
  static const String hasGuarantors = "hasGuarantors";

  static const String baseUrl = 'https://mobile-app.o2intlfin.com/';
}
