import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/bank_details.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class BankDetails extends StatelessWidget {
  BankDetails({Key? key}) : super(key: key);
  final ctrl = Get.put(BankDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Bank Details"),
      body: GetBuilder<BankDetailsController>(
          initState: (controller) {},
          builder: (controller) {
            return Container();
            // StreamBuilder(
            //     stream: OxygenApp.firestore
            //         .collection('bankDetails')
            //         .where('userID', isEqualTo: controller.userId)
            //         .snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: Column(
            //             children: [
            //               SizedBox(height: 10.h),
            //               SpinKitDoubleBounce(
            //                 color: oxygenPrimaryColor,
            //                 size: 10.h,
            //               ),
            //             ],
            //           ),
            //         );
            //       }

            //       if (snapshot.data!.docs.isEmpty) {
            //         return Center(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SizedBox(height: 5.h),
            //               Image.asset(
            //                 "assets/images/card.png",
            //                 height: 30.h,
            //                 width: 60.w,
            //                 fit: BoxFit.cover,
            //               ),
            //               SizedBox(height: 2.h),
            //               Text("No saved bank details",
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodyText2!
            //                       .copyWith(
            //                           color: Colors.black, fontSize: 13.sp)),
            //             ],
            //           ),
            //         );
            //       }

            //       return Container(
            //         constraints: BoxConstraints(
            //           minHeight: 40.h,
            //         ),
            //         child: ListView.builder(
            //           scrollDirection: Axis.vertical,
            //           physics: NeverScrollableScrollPhysics(),
            //           shrinkWrap: true,
            //           itemCount: snapshot.data!.docs.length,
            //           itemBuilder: (context, index) {
            //             final DocumentSnapshot _card =
            //                 snapshot.data!.docs[index];

            //             return InkWell(
            //                 onTap: () {},
            //                 child: BankBox(
            //                   name: _card['accountName'],
            //                   number: _card['bank'],
            //                   bank: _card['AccountNumber'],
            //                   bankDetailsID: _card['docId'],
            //                 ));
            //           },
            //         ),
            //       );
            //     });
          }),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: oxygenPrimaryColor,
        onPressed: () {
          ctrl.showModal();
        },
        label: Text(
          "Add new entry",
          style: TextStyle(
            fontSize: 11.sp,
            fontFamily: "Muli",
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BankBox extends StatelessWidget {
  const BankBox(
      {Key? key,
      required this.name,
      required this.number,
      required this.bank,
      required this.bankDetailsID})
      : super(key: key);
  final String name, number, bank, bankDetailsID;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BankDetailsController>(
        initState: (controller) {},
        builder: (controller) {
          return Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFf1f0f0),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                        Text(
                          bank,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                        Text(
                          number,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //  controller.deleteBank(bankDetailsID);
                    },
                    child: Icon(CupertinoIcons.delete,
                        color: oxygenPrimaryColor, size: 50.sp),
                  )
                ],
              ),
            ),
          );
        });
  }
}

//flutter create -a kotlin .
