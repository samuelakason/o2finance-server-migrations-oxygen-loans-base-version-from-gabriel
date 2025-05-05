import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool one = true;
  bool two = false;
  bool three = false;
  String firstName =
      OxygenApp.sharedPreferences!.getString(OxygenApp.firstName).toString();
  String lastName =
      OxygenApp.sharedPreferences!.getString(OxygenApp.lastName).toString();
  String homeAddress =
      OxygenApp.sharedPreferences!.getString(OxygenApp.houseAddress).toString();
  String gName = OxygenApp.sharedPreferences!
      .getString(OxygenApp.guarantorName)
      .toString();
  String gAddress = OxygenApp.sharedPreferences!
      .getString(OxygenApp.guarantorAddress)
      .toString();

  String bvn = OxygenApp.sharedPreferences!.getString(OxygenApp.bvn).toString();
  String email =
      OxygenApp.sharedPreferences!.getString(OxygenApp.email).toString();
  String phoneNumber =
      OxygenApp.sharedPreferences!.getString(OxygenApp.phoneNumber).toString();

  //2
  String familyname1 =
      OxygenApp.sharedPreferences!.getString(OxygenApp.familyname1).toString();
  String familynumber1 = OxygenApp.sharedPreferences!
      .getString(OxygenApp.familyNumber1)
      .toString();
  String familyrelationship1 = OxygenApp.sharedPreferences!
      .getString(OxygenApp.familyRelationship1)
      .toString();

  String familyname2 =
      OxygenApp.sharedPreferences!.getString(OxygenApp.familyname2).toString();
  String familynumber2 = OxygenApp.sharedPreferences!
      .getString(OxygenApp.familyNumber2)
      .toString();
  String familyrelationship2 = OxygenApp.sharedPreferences!
      .getString(OxygenApp.familyRelationship2)
      .toString();

//3
  String idType =
      OxygenApp.sharedPreferences!.getString(OxygenApp.idType).toString();

  String idNumber =
      OxygenApp.sharedPreferences!.getString(OxygenApp.idNumber).toString();

  String emplymentStatus = OxygenApp.sharedPreferences!
      .getString(OxygenApp.emplymentStatus)
      .toString();
  String incomeFrequency = OxygenApp.sharedPreferences!
      .getString(OxygenApp.incomeFrequency)
      .toString();
  String incomeValue =
      OxygenApp.sharedPreferences!.getString(OxygenApp.incomeValue).toString();
  String payDay =
      OxygenApp.sharedPreferences!.getString(OxygenApp.payDay).toString();

  bool? isCompleteProfile =
      OxygenApp.sharedPreferences!.getBool(OxygenApp.isCompleteProfile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Review Application profile"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(4.w),
        child: isCompleteProfile!
            ? Column(
                children: [
                  selector(),
                  SizedBox(height: 4.h),
                  Container(
                    child: one
                        ? oneBox()
                        : two
                            ? twoBox()
                            : three
                                ? threeBox()
                                : Container(),
                  )
                ],
              )
            : Column(
                children: [
                  SvgPicture.asset(
                    "assets/icons/agent.svg",
                    height: 35.h,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "You have not completed profile information, open the loan screen and complete the forms",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "Muli",
                        color: Colors.black),
                  ),
                ],
              ),
      ),
    );
  }

  Widget oneBox() {
    return Container(
      child: Column(
        children: [
          reviewDetailBox("First Name", firstName),
          SizedBox(height: 2.h),
          reviewDetailBox("Last Name", lastName),
          SizedBox(height: 2.h),
          reviewDetailBox("Home address", homeAddress),
          SizedBox(height: 2.h),
          reviewDetailBox("Guarantor name", gName),
          SizedBox(height: 2.h),
          reviewDetailBox("Guarantor address", gAddress),
          SizedBox(height: 2.h),
          reviewDetailBox("Email address", email),
          SizedBox(height: 2.h),
          reviewDetailBox("Phone number", phoneNumber),
          SizedBox(height: 2.h),
          reviewDetailBox("BVN", bvn),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget twoBox() {
    return Container(
      child: Column(
        children: [
          reviewDetailBox("Name", familyname1),
          SizedBox(height: 2.h),
          reviewDetailBox("Phone number", familynumber1),
          SizedBox(height: 2.h),
          reviewDetailBox("Relationship", familyrelationship1),
          SizedBox(height: 2.h),
          SizedBox(height: 2.h),
          Divider(color: Colors.grey),
          SizedBox(height: 2.h),
          reviewDetailBox("Name", familyname2),
          SizedBox(height: 2.h),
          reviewDetailBox("Phone number", familynumber2),
          SizedBox(height: 2.h),
          reviewDetailBox("Relationship", familyrelationship2),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget threeBox() {
    return Container(
      child: Column(
        children: [
          reviewDetailBox("Employment Status", emplymentStatus),
          SizedBox(height: 2.h),
          reviewDetailBox("Income frequency", incomeFrequency),
          SizedBox(height: 2.h),
          reviewDetailBox("Income Value", incomeValue),
          SizedBox(height: 2.h),
          reviewDetailBox("Pay day", payDay),
          SizedBox(height: 2.h),
          reviewDetailBox("ID Type", idType),
          SizedBox(height: 2.h),
          reviewDetailBox("ID number", idNumber),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget reviewDetailBox(String title, String value) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
        ),
        Container(
          width: 100.w,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3.w)),
          child: Text(
            value,
            style: TextStyle(
                fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
          ),
        ),
      ],
    ));
  }

  Widget selector() {
    return Container(
      width: 100.w,
      height: 5.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(3.w)),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                one = true;
                two = false;
                three = false;
              });
            },
            child: Container(
              height: 5.h,
              width: 31.w,
              padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 0),
              decoration: BoxDecoration(
                  color: one ? oxygenPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(3.w)),
              child: Center(
                child: Text(
                  "1",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: one ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                one = false;
                two = true;
                three = false;
              });
            },
            child: Container(
              height: 5.h,
              width: 31.w,
              padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 0),
              decoration: BoxDecoration(
                  color: two ? oxygenPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(3.w)),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: two ? Colors.white : Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                one = false;
                two = false;
                three = true;
              });
            },
            child: Container(
              height: 5.h,
              width: 30.w,
              padding: EdgeInsets.fromLTRB(7.w, 0, 7.w, 0),
              decoration: BoxDecoration(
                  color: three ? oxygenPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(3.w)),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: three ? Colors.white : Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//flutter create -a kotlin .
