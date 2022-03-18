import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const routeId = "profile_screen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("profile Screen"),
    );
  }
}
