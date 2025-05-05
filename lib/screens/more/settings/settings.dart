import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/config/color_config.dart';
import 'package:oxygen_loans/config/oxygen.dart';
import 'package:oxygen_loans/screens/auth/login.dart';
import 'package:oxygen_loans/screens/more/settings/add_cards.dart';
import 'package:oxygen_loans/screens/more/settings/bank_details.dart';
import 'package:oxygen_loans/screens/more/settings/change_pin.dart';
import 'package:oxygen_loans/screens/more/settings/change_pin_check.dart';
import 'package:oxygen_loans/screens/more/settings/review.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:oxygen_loans/shared_widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Settings"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        padding: EdgeInsets.all(4.w),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => Review());
                  Navigator.push(context, route);
                },
                child: bleBox("Review application profile")),
            InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => AddCard());
                  Navigator.push(context, route);
                },
                child: bleBox("Add card details")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => BankDetails());
                  Navigator.push(context, route);
                },
                child: bleBox("Bank details")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => ChangePinCheck());
                  Navigator.push(context, route);
                },
                child: bleBox("Change payment pin")),
            InkWell(
                onTap: () {
                  showModal();
                },
                child: bleBox("Log out"))
          ],
        ));
  }

  Widget bleBox(String title) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
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
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 12.sp, fontFamily: "Muli", color: Colors.black),
                ),
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 17.sp,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showModal() {
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
                    initialChildSize: 0.47,
                    minChildSize: 0.2,
                    maxChildSize: 0.47,
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
                              CupertinoIcons.drop_triangle,
                              color: Colors.red,
                              size: 12.h,
                            ),
                            Text(
                              "Are you sure you want to sign out?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily: "Muli",
                                  color: Colors.black),
                            ),
                            SizedBox(height: 4.h),
                            MainButton(
                                title: "Yes",
                                callback: () {
                                  // OxygenApp.auth!.signOut().then((value) {
                                  //   Route route = MaterialPageRoute(
                                  //       builder: (_) => Login());
                                  //   Navigator.push(context, route);
                                  //   OxygenApp.sharedPreferences!.clear();
                                  // });
                                }),
                            SizedBox(height: 2.h),
                            MainButton(
                                title: "Cancel",
                                callback: () {
                                  Navigator.pop(context);
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
}
//flutter create -a kotlin .

 
 