import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/controllers/bills/airtime.dart';
import 'package:oxygen_loans/controllers/bills/airtime_contacts.dart';
//import 'package:oxygen_loans/screens/bills/airtime/airtime_details.dart';
import 'package:oxygen_loans/screens/bills/airtime/widgets/search_box.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AirtimeContacts extends StatelessWidget {
  AirtimeContacts({Key? key}) : super(key: key);
  var ctrl = Get.find<AirtimeController>();
  final ctrl2 = Get.put(AirtimeContactsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 100.h,
          ),
          padding: EdgeInsets.fromLTRB(4.w, 1.w, 4.w, 5.w),
          child: GetBuilder<AirtimeContactsController>(
              initState: (controller) {},
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: oxygenPrimaryColor,
                            size: 20.sp,
                          ),
                        ),
                        Text(
                          "Phone Contacts",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                        Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              fontFamily: "Muli",
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    ContactSearch(),
                    SizedBox(height: 2.h),
                    controller.contacts!.isNotEmpty
                        //Build a list view of all contacts, displaying their avatar and
                        // display name
                        ? Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.isSearching == true
                                  ? controller.contactsFiltered!.length
                                  : controller.contacts?.length,
                              itemBuilder: (BuildContext context, int index) {
                                Contact contact = controller.isSearching == true
                                    ? controller.contactsFiltered![index]
                                    : controller.contacts![index];
                                return InkWell(
                                  onTap: () async {
                                    // ctrl.numberTextEditingController.text =
                                    //     contact.phones!
                                    //         .elementAt(0)
                                    //         .value
                                    //         .toString();
                                    // controller.currentDialed = contact.phones!
                                    //     .elementAt(0)
                                    //     .value
                                    //     .toString();
                                    // controller.update();
                                    // Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 18),
                                    leading: (contact.avatar != null &&
                                            contact.avatar!.isNotEmpty)
                                        ? CircleAvatar(
                                            backgroundImage:
                                                MemoryImage(contact.avatar!),
                                          )
                                        : CircleAvatar(
                                            child: Text(contact.initials()),
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                          ),
                                    title: Padding(
                                      padding: EdgeInsets.only(bottom: 3.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                contact.displayName ?? '',
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: "Muli",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(height: 30.h),
                              Center(
                                child: SpinKitSpinningLines(
                                    color: Colors.white, size: 15.h),
                              ),
                            ],
                          ),
                  ],
                );
              }),
        ),
      ),
    ));
  }
}
