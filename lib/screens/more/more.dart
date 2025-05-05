// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen_loans/config/oxygen.dart';

import 'package:oxygen_loans/screens/bills/bills.dart';
import 'package:oxygen_loans/screens/more/agent/agent.dart';
import 'package:oxygen_loans/screens/more/editprofile.dart';
import 'package:oxygen_loans/screens/more/history/history.dart';
import 'package:oxygen_loans/screens/more/membership/membership.dart';
import 'package:oxygen_loans/screens/more/payment_cards/payment_cards.dart';
import 'package:oxygen_loans/screens/more/settings/settings.dart';

import 'package:oxygen_loans/screens/more/support/support.dart';
import 'package:oxygen_loans/screens/referal/referal.dart';
import 'package:oxygen_loans/screens/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class More extends StatefulWidget {
  More({Key? key}) : super(key: key);

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("More"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => EditProfile());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/personMore.svg",
                  Color(0xFF093D49),
                  "Profile",
                  "Edit your personal information, change password, sign-out",
                ),
              ),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => Bills());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/shopMore.svg",
                  Color(0xFFFA6E08),
                  "Bills",
                  "Buy airtime and pay bills on O2 app",
                ),
              ),
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => History());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/historyMore.svg",
                  Color(0xFFF938FD),
                  "Transaction History",
                  "View all transactions on your account.",
                ),
              ),

              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => Refer());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/referralsMore.svg",
                  Color(0xFF1697B6),
                  "Referrals",
                  "Share your code with friends to earn points which can be converted to money.",
                ),
              ),
              InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => PaymentCards());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/personMore.svg",
                  Color(0xFF093D49),
                  "Payment cards",
                  "Save your debit cards for easy access",
                ),
              ),
              /*
              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => RealEstate());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/Settings.svg",
                  Color(0xFF00AEFF),
                  "Real estate",
                  "Invest in our real estate opportunities and track all your activities and transactions",
                ),
              ),
              */
              // InkWell(
              //   onTap: () {
              //     Route route = MaterialPageRoute(builder: (_) => Agent());
              //     Navigator.push(context, route);
              //   },
              //   child: moreBox(
              //     "assets/icons/historyMore.svg",
              //     Color(0xFFF938FD),
              //     "Agent",
              //     "Apply for loan on behalf of your friends or family.",
              //   ),
              // ),

              InkWell(
                onTap: () {
                  Route route = MaterialPageRoute(builder: (_) => Support());
                  Navigator.push(context, route);
                },
                child: moreBox(
                  "assets/icons/supportMore.svg",
                  Color(0xFF50EEA2),
                  "Support",
                  "Contact support with your inquiries and questions.",
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Route route = MaterialPageRoute(builder: (_) => Settings());
              //     Navigator.push(context, route);
              //   },
              //   child: moreBox(
              //     "assets/icons/Settings.svg",
              //     Colors.redAccent,
              //     "Settings",
              //     "Make changes to your account and change preferences.",
              //   ),
              // ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget moreBox(String img, Color color, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          SizedBox(height: 1.5.h),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    img,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF333333),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        desc,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Muli",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF808080),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0),
                  child: SvgPicture.asset("assets/icons/next-n.svg",
                      color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(height: 1.5.h),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
