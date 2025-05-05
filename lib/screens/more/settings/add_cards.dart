import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/controllers/more/add_card.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class AddCard extends StatelessWidget {
  AddCard({Key? key}) : super(key: key);
  final ctrl = Get.put(AddCardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar2("Bank Details"),
            body: Container(),
            // StreamBuilder(
            //     stream: OxygenApp.firestore
            //         .collection('AddCard')
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
            //               Text("No saved cards",
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
            //                 child: CardDisplayBox(
            //                   bank: _card['authBank'],
            //                   lastFour: "**** **** **** " + _card['authLast'],
            //                   cardID: _card['docId'],
            //                 ));
            //           },
            //         ),
            //       );
            //     }),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: oxygenPrimaryColor,
              onPressed: () {
                //  controller.displayDialog(); //showModal();
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
        });
    ;
  }
}

class CardDisplayBox extends StatelessWidget {
  const CardDisplayBox(
      {Key? key,
      required this.bank,
      required this.lastFour,
      required this.cardID})
      : super(key: key);
  final String bank, lastFour, cardID;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(
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
              child: Container(
                padding: EdgeInsets.all(5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bank,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          lastFour,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Muli",
                              color: Colors.black),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        //controller.displayDialog2(cardID);
                      },
                      child: Icon(
                        CupertinoIcons.delete,
                        size: 25.sp,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
