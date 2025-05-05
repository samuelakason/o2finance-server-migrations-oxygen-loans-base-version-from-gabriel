import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';

class Faq2 extends StatefulWidget {
  const Faq2({Key? key, required this.index}) : super(key: key);
  final String index;

  @override
  _Faq2State createState() => _Faq2State();
}

class _Faq2State extends State<Faq2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("FAQ"),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (widget.index == "1") {
      return one();
    } else if (widget.index == "2") {
      return two();
    } else if (widget.index == "3") {
      return three();
    } else if (widget.index == "4") {
      return four();
    } else if (widget.index == "5") {
      return five();
    } else if (widget.index == "6") {
      return six();
    } else {
      return Container();
    }
  }

  Widget one() {
    return Column(children: [
      supportAnswers("What is 02 Finance",
          "02 Finance is a finance app that offers loans on the go anywhere in Nigeria without collateral at a relatively low-interest rate, pay utility bills, shop on credit, and pay back on payday provided you are a registered member, make payments to vendors from your 02 Finance Wallet, and also review listings of Real Estate properties in Abuja and Lagos. We are Fast, Efficient, and Reliable."),
      supportAnswers("Where is 02 Loan located?",
          "Our offices are located in Abuja and Lagos."),
      supportAnswers("In what country does 02 Finance operate?",
          "We currently operate in Nigeria."),
    ]);
  }

  Widget two() {
    return Column(children: [
      supportAnswers("Requirements",
          "02 FINANCE requirements are very simple, all you need is a phone number and a bank account. We will also need access to the data on your phone in order to build your credit score."),
      supportAnswers("How long does the application process take?",
          "All loan applications will be processed within the hour."),
      supportAnswers("How does O2 FINANCE  make lending decisions?",
          "02 uses data from your phone, including your financial transaction messages to make lending decisions, we analyze this with your 02 repayment history to build an appropriate credit score, which determines the loan offers you receive."),
    ]);
  }

  Widget three() {
    return Column(children: [
      supportAnswers("Can I trust O2 with my data?",
          "We use standard data security and encryption techniques to save the data you share with us .02 will never share your information with a third party unless it is for your loan purpose, which might be reporting defaulted loans to authorized credit bureaus."),
      supportAnswers("Why does O2 need my BVN?",
          "O2 uses your bvn to ensure you are the owner of the account and no one can apply for loan using your account. Please contact the customer service for additional enquiries."),
    ]);
  }

  Widget four() {
    return Column(children: [
      supportAnswers("How do I apply for a loan?",
          "Applying for a loan is simple! After you have downloaded the 02 application from Google Play Store or App Store, you will be required to fill in your details and then proceed to the next page, review your loan offers, and submit your request."),
      supportAnswers("How much can I borrow?",
          "Our loan ranges between NGN1,000  and NGN500,000. Early payment builds your credit score and qualifies you for a higher loan on your next request."),
      supportAnswers("Can I apply for a larger loan than shown?",
          "Unfortunately, this is not possible you can call the customer care line for such urgency."),
    ]);
  }

  Widget five() {
    return Column(children: [
      supportAnswers2(
          "What is the interest rate of 02 Finance loans",
          "Our interest rate vary due to some common factors like our cost.",
          "-loan terms-4weeks-12months",
          "-late/Rollover-1%",
          "-Interest range:7%-28%",
          "-Equivalent monthly interest:1%-21%",
          "-Equivalent Apr:15%-260%"),
      supportAnswers(
          "Will my loan offer increase when I repay my previous loan?",
          "This may not increase immediately but will increase over time as you continue to make all your repayments as scheduled."),
    ]);
  }

  Widget six() {
    return Column(children: [
      supportAnswers3(
        "Get 02 international membership card",
        '02 FINANCE membership card gives you access to shop anytime, anywhere in the city All you have to do is get the card, register and shop all you want while we pay for you.',
        'Our Partners :',
        'Shoprite',
      ),
      supportAnswers("What can I shop?",
          "You can buy whatever you want in the range of your eligibility provided that you have the 02 Finance Membership Card which gives you access to shop with our partners within Abuja and Lagos. "),
    ]);
  }

  Widget supportAnswers(String q, String a) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Q: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF4F4F4F),
              ),
            ),
            SizedBox(width: 1.w),
            Container(
              width: 87.w,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    q,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        a,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Divider(color: Colors.grey),
        SizedBox(height: 1.h),
      ],
    );
  }

  Widget supportAnswers2(String q, String a1, String a2, String a3, String a4,
      String a5, String a6) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Q: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF4F4F4F),
              ),
            ),
            SizedBox(width: 1.w),
            Container(
              width: 87.w,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    q,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        a1,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a2,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a3,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a4,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a5,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a6,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Divider(color: Colors.grey),
        SizedBox(height: 1.h),
      ],
    );
  }

  Widget supportAnswers3(String q, String a1, String a2, String a3) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Q: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: "Muli",
                color: Color(0xFF4F4F4F),
              ),
            ),
            SizedBox(width: 1.w),
            Container(
              width: 87.w,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    q,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Muli",
                      color: Color(0xFF4F4F4F),
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        a1,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a2,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        a3,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Muli",
                          color: Color(0xFF4F4F4F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Divider(color: Colors.grey),
        SizedBox(height: 1.h),
      ],
    );
  }
}
