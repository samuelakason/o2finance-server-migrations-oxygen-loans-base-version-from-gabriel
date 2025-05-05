import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:sizer/sizer.dart';

class Loadericons {
  preloader(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        // animationType: DialogTransitionType.slideFromBottom,
        // curve: Curves.fastOutSlowIn,
        // duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent),
                        child: Center(
                          child: SpinKitWaveSpinner(
                              color: Colors.white,
                              trackColor: Theme.of(context).primaryColor,
                              waveColor: Colors.white,
                              size: 15.h),
                        ),
                      ),
                    ],
                  ),
                ));
          });
        });
  }
}
