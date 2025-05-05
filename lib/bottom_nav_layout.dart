import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxygen_loans/config/color_config.dart';

import 'package:oxygen_loans/screens/bills/bills.dart';
import 'package:oxygen_loans/screens/dashboard/dashboard.dart';

import 'package:oxygen_loans/screens/invest/invest.dart';
import 'package:oxygen_loans/screens/loans/loans.dart';
import 'package:oxygen_loans/screens/more/more.dart';
import 'package:oxygen_loans/screens/real_estate/real_estate.dart';

import 'package:oxygen_loans/screens/shops/shops.dart';
import 'package:sizer/sizer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, required this.sIndex}) : super(key: key);
  final int sIndex;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.sIndex;
  }

  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Loans(),
    RealEstate(),
    //Container(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedLabelStyle: TextStyle(
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 10.sp : 7.sp),
        selectedItemColor: oxygenPrimaryColor,
        unselectedLabelStyle: TextStyle(
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 10.sp : 7.sp),
        unselectedItemColor: Color(0xFFBDBDBD),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.home, color: Colors.grey),
            ),
            label: "Home",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.home, color: oxygenPrimaryColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/naira.svg",
                color: Color(0xFFBDBDBD),
              ),
            ),
            label: "Loans",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/naira.svg",
                color: oxygenPrimaryColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/Invest.svg",
                color: Color(0xFFBDBDBD),
              ),
            ),
            label: "Real Estate",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/Invest.svg",
                color: oxygenPrimaryColor,
              ),
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Padding(
          //     padding: EdgeInsets.only(bottom: 4.0),
          //     child: Icon(
          //       CupertinoIcons.shopping_cart,
          //       color: Color(0xFFBDBDBD),
          //       size: 20.sp,
          //     ),
          //   ),
          //   label: "02 Shops",
          //   activeIcon: Padding(
          //     padding: EdgeInsets.only(bottom: 4.0),
          //     child: Icon(
          //       CupertinoIcons.shopping_cart,
          //       color: oxygenPrimaryColor,
          //       size: 20.sp,
          //     ),
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/more.svg",
                color: Color(0xFFBDBDBD),
              ),
            ),
            label: "More",
            activeIcon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: SvgPicture.asset(
                "assets/icons/more.svg",
                color: oxygenPrimaryColor,
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
