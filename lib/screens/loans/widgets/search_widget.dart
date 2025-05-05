import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.ctrl}) : super(key: key);
  final TextEditingController ctrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(2.w),
        ),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextFormField(
        controller: ctrl,
        cursorColor: Colors.black,
        style: TextStyle(
            color: Colors.white,
            fontSize: SizerUtil.deviceType == DeviceType.mobile ? 4.w : 3.w),
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(
                Icons.search,
                size: 20.sp,
                color: Colors.grey,
              ),
            ),
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: "Search Contacts",
            hintStyle: TextStyle(
              fontFamily: "Muli",
              color: Colors.black,
            )),
      ),
    );
  }
}
