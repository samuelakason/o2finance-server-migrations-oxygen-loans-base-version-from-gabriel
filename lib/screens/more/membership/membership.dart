import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxygen_loans/bottom_nav_layout.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/screens/widgets/loaders.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class Membership extends StatefulWidget {
  Membership({Key? key}) : super(key: key);

  @override
  _MembershipState createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  String firstname =
      OxygenApp.sharedPreferences!.getString(OxygenApp.firstName).toString();
  String lastname =
      OxygenApp.sharedPreferences!.getString(OxygenApp.lastName).toString();
  String first =
      OxygenApp.sharedPreferences!.getString(OxygenApp.firstSet).toString();
  String second =
      OxygenApp.sharedPreferences!.getString(OxygenApp.secondSet).toString();
  String third =
      OxygenApp.sharedPreferences!.getString(OxygenApp.thirdSet).toString();
  String fourth =
      OxygenApp.sharedPreferences!.getString(OxygenApp.fourthSet).toString();
  String userID =
      OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
  bool isMember = false;
  bool isDoneChecking = false;
  bool? cardStatus;
  final TextEditingController mAddressctrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("02 Membership"),
      body: Column(
        children: [
          Image.asset(
            "assets/images/coming.png",
            height: 40.h,
          ),
          Text(
            'Coming soon....',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(4.w),
            child: isDoneChecking == false
                ? SpinKitDoubleBounce(
                    color: oxygenPrimaryColor,
                    size: 10.h,
                  )
                : isMember == true
                    ? isMemberBox()
                    : isMember == false
                        ? memApplication()
                        : Container()));
  }

  Widget memApplication() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 3.h),
          Center(
            child: SvgPicture.asset(
              "assets/icons/agent.svg",
              height: 35.h,
            ),
          ),
          Text(
            "All 02 members are entitled to the 02 membership card, enter the address you desire you card to be sent to",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "Muli",
              color: Color(0xFF4F4F4F),
            ),
          ),
          authFormField("", mAddressctrl, "Address", false),
          InkWell(
            onTap: () {
              becomeMemebr();
            },
            child: Container(
              height: 8.h,
              margin: EdgeInsets.fromLTRB(0, 23, 0, 28),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: oxygenPrimaryColor),
              child: Center(
                child: Text(
                  "Become a member",
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget isMemberBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        walletBalance(),
        SizedBox(height: 4.h),
        SizedBox(height: 2.h),
        cardStatus! ? matured() : cardNotCollected()
      ],
    );
  }

  Widget cardNotCollected() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.h),
        Text(
          "Your card is being processed and will be available shortly, you will be communicated via email once it has been sent",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Muli",
              color: Color(0xFF4F4F4F),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget walletBalance() {
    return Container(
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      height: 27.h,
      width: 100.w,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Colors.black,
            Colors.black,
            Colors.blue,
          ],
          center: Alignment(0.6, -0.3),
          focal: Alignment(0.3, -0.1),
          focalRadius: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              "assets/images/l1.png",
              height: 3.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  firstname + " " + lastname,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/chipp.jpg",
                  height: 5.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Container(
            child: Text(
              first + "  " + second + "  " + third + "  " + fourth,
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: "Muli",
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget matured() {
    String userID =
        OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
    return Container(
      padding: EdgeInsets.only(left: 3.w, right: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "History",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "Muli",
                color: Color(0xFF4F4F4F),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h),
          // StreamBuilder(
          //     stream: OxygenApp.firestore
          //         .collection('shops')
          //         .where('userId', isEqualTo: userID)
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

          //       if (snapshot.data!.docs.length < 1) {
          //         return Center(
          //           child: noItems("You dont have any completed loan"),
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
          //             final DocumentSnapshot _card = snapshot.data!.docs[index];

          //             return InkWell(
          //               onTap: () {},
          //               child: invest(
          //                   _card['amount'],
          //                   OxygenApp.timeFormat2
          //                       .format(_card['date'].toDate()),
          //                   CupertinoIcons.shopping_cart),
          //             );
          //           },
          //         ),
          //       );
          //     }),
        ],
      ),
    );
  }

  Widget invest(String title, String time, IconData icon) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                        color: oxygenPrimaryColor, shape: BoxShape.circle),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF093D49),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text("")
            ],
          ),
          SizedBox(height: 2.h),
          Divider(color: Colors.grey),
          SizedBox(height: 2.h)
        ],
      ),
    );
  }

  Widget noItems(String title) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Image.asset(
            "assets/images/splash2.png",
            height: 26.h,
            width: 60.w,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 2.h),
          Text(
            title,
            style: TextStyle(
                fontSize: 10.sp, fontFamily: "Muli", color: Color(0xFF05242C)),
          ),
        ],
      ),
    );
  }

  Widget authFormField(String title, TextEditingController controller,
      String hint, bool isObscure) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              fontFamily: "Muli",
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 1.h),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          style: TextStyle(
              color: Colors.black,
              fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.5.h),
            labelText: hint,
            labelStyle: TextStyle(
                fontSize: 10.sp, fontFamily: "Muli", color: Colors.grey),
            fillColor: Color(0xFF0f1245),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(2.w),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.9),
              borderRadius: BorderRadius.circular(2.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.9),
              borderRadius: BorderRadius.circular(2.w),
            ),
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }

  becomeMemebr() {
    // LoadersIcons().preloader(context);
    // String userID =
    //     OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
    // String firstname =
    //     OxygenApp.sharedPreferences!.getString(OxygenApp.firstName).toString();
    // String lastname =
    //     OxygenApp.sharedPreferences!.getString(OxygenApp.lastName).toString();
    // OxygenApp.firestore.collection("users").doc(userID).update({
    //   "isMember": true,
    // }).then((value) {
    //   Navigator.pop(context);
    //   showModal(
    //       "Congrats, you are now an 02 member, you will be contacted on how you will get your 02 card");
    // });

    // OxygenApp.firestore.collection("members").doc(userID).set({
    //   "memberID": userID,
    //   "firstName": firstname,
    //   "lastName": lastname,
    //   "isCardColledted": false,
    //   "address": mAddressctrl.text.trim(),
    //   "date": DateTime.now(),
    // }).then((value) {});
  }

  showModal(String message) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        bool accepted = false;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return GestureDetector(
              onDoubleTap: () =>
                  Navigator.of(context, rootNavigator: true).pop(),
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.001),
                child: GestureDetector(
                  onTap: () {},
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.4,
                    minChildSize: 0.2,
                    maxChildSize: 0.40,
                    builder: (_, controller) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.w),
                            topRight: Radius.circular(5.w),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 4.h),
                            Icon(
                              CupertinoIcons.check_mark_circled,
                              color: oxygenPrimaryColor,
                              size: 12.h,
                            ),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Muli",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 4.h),
                            MainButton(
                                title: "Okay",
                                callback: () {
                                  Route route = MaterialPageRoute(
                                      builder: (_) => MainScreen(sIndex: 4));
                                  Navigator.pushReplacement(context, route);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ));
          ;
        });
      },
    );
  }

  getUserDetails() async {
    // String userID =
    //     OxygenApp.sharedPreferences!.getString(OxygenApp.userUID).toString();
    // var loanDetails =
    //     await OxygenApp.firestore.collection('users').doc(userID).get();
    // var cardDetails =
    //     await OxygenApp.firestore.collection('members').doc(userID).get();

    // setState(() {
    //   isMember = loanDetails["isMember"];
    //   //isMember = false;
    //   if (isMember) {
    //     cardStatus = cardDetails["isCardColledted"];
    //   }

    //   isDoneChecking = true;
    // });
  }
}
