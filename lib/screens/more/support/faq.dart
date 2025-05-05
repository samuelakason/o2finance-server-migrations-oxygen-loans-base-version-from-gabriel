import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/more/support/fag2.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("FAQ"),
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
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '1'));
                  Navigator.push(context, route);
                },
                child: faqBox("About 02 Finance")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '2'));
                  Navigator.push(context, route);
                },
                child: faqBox("Eligibility criteria")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '3'));
                  Navigator.push(context, route);
                },
                child: faqBox("Security and privacy")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '4'));
                  Navigator.push(context, route);
                },
                child: faqBox("Loan offers")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '5'));
                  Navigator.push(context, route);
                },
                child: faqBox("Interest")),
            InkWell(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (_) => Faq2(index: '6'));
                  Navigator.push(context, route);
                },
                child: faqBox("02 shops and membershoip card")),
          ],
        ));
  }

  Widget faqBox(String title) {
    return Container(
        child: Column(
      children: [
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF4F4F4F),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              color: Colors.black,
              size: 15.sp,
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Divider(color: Colors.grey),
      ],
    ));
  }
}
