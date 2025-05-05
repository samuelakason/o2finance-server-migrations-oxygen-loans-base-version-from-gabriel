import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class BankCodes extends StatefulWidget {
  const BankCodes({Key? key}) : super(key: key);

  @override
  _BankCodesState createState() => _BankCodesState();
}

class _BankCodesState extends State<BankCodes> {
  List<String> names = [];
  List<String> codes = [];
  List resulted = [];
  String secretKey = "sk_test_dcc48298cd95185a28d9fa2b448b006463d2e169";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Help & BankCodes"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        child: Column(
      children: [
        InkWell(
            onTap: () {
              checkBank();
            },
            child: Text("data")),
        Row(
          children: [
            Container(
              height: 50.h,
              width: 45.w,
              child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5.w, 0.w, 5.w, 0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              names[index].toString(),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Muli",
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )
      ],
    ));
  }

  checkBank() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $secretKey",
    };

    http.Response response = await http.get(
      Uri.parse('https://api.paystack.co/bank'),
      headers: headers,
    );

    final Map body = json.decode(response.body);
    resulted = body['data'];
    for (var i = 60; i < 70; i++) {
      //names.add(resulted[i]["name"]);
      print(resulted[i]["name"] + "  :  " + resulted[i]["code"]);
    }
    print(names.length);
  }
}
