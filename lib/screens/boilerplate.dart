import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Help & Support"),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Container(
        child: Column(
      children: [],
    ));
  }
}
//flutter create -a kotlin .
