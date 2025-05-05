import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/bills/airtime/airtime_network_select.dart';
import 'package:oxygen_loans/screens/bills/cable/cable.dart';
import 'package:oxygen_loans/screens/bills/data/data_networks.dart';
import 'package:oxygen_loans/screens/bills/electricity/electricty_providers.dart';

import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Bills extends StatefulWidget {
  Bills({Key? key}) : super(key: key);

  @override
  _BillsState createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Pay bills"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => AirtimeNetworkSelect());
                  Navigator.push(context, route);
                },
                child: utilityBox("Airtime")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => DataNetworkSelect());
                  Navigator.push(context, route);
                },
                child: utilityBox("Data")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => ElectricityProviders());
                  Navigator.push(context, route);
                },
                child: utilityBox("Electricity")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => CableProviders());
                  Navigator.push(context, route);
                },
                child: utilityBox("Cable Tv")),
          ],
        ),
      ),
    );
  }

  Widget utilityBox(String title) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF093D49),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              color: Color(0xFF093D49),
              size: 15.sp,
            )
          ],
        ),
        SizedBox(height: 2.5.h),
        Divider(color: Color(0xFFBDBDBD)),
      ],
    );
  }
}
