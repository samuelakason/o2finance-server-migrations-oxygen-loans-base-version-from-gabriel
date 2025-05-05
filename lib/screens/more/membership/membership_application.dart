import 'package:flutter/material.dart';
import 'package:oxygen_loans/screens/widgets/appbar_2.dart';

class MembershipApplication extends StatefulWidget {
  const MembershipApplication({Key? key}) : super(key: key);

  @override
  _MembershipApplicationState createState() => _MembershipApplicationState();
}

class _MembershipApplicationState extends State<MembershipApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar2("Membership Application"),
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
