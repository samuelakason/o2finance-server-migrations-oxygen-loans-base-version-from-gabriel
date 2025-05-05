import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:oxygen_loans/services/global_context.dart';
import 'package:sizer/sizer.dart';

class AppBottomSheet {
  bottomSheet(Widget widget, double height) {
    showModalBottomSheet(
        context: GlobalContextService.navigatorKey.currentContext!,
        barrierColor: Colors.black.withOpacity(0.7),
        isScrollControlled: true, // only work on showModalBottomSheet function
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.w), topRight: Radius.circular(4.w)),
        ),
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                  height:
                      height, //height or you can use Get.width-100 to set height
                  child: widget),
            ));
  }

  displayDialog(
      BuildContext context, double height, double width, Widget widget) {
    showAnimatedDialog(
        context: context,
        barrierDismissible: true,
        animationType: DialogTransitionType.slideFromBottom,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 700),
        builder: (c) {
          return StatefulBuilder(builder: (context, setState) {
            return Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.all(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      //  padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
                      child: widget,
                    ),
                  ],
                ));
          });
        });
  }

  showCallSheet(Widget dispBox, VoidCallback callback) {
    showModalBottomSheet(
        context: GlobalContextService.navigatorKey.currentContext!,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return GestureDetector(
              onTap: callback,
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.001),
                child: GestureDetector(
                  onTap: () {},
                  child: DraggableScrollableSheet(
                    initialChildSize: 0.64,
                    minChildSize: 0.2,
                    maxChildSize: 0.64,
                    builder: (_, controller) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: callback,
                            child: Icon(
                              CupertinoIcons.xmark_circle_fill,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                          ),
                          Container(
                              width: 100.w,
                              height: 50.h,
                              margin: EdgeInsets.fromLTRB(4.w, 4.w, 4.w, 7.h),
                              // padding: EdgeInsets.fromLTRB(3.w, 0, 3.w, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.w)),
                              ),
                              child: dispBox),
                        ],
                      );
                    },
                  ),
                ),
              ));
        });
  }
}
