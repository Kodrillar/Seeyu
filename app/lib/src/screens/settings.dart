import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';
import '../widgets/setting_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeId = "setting_screen";
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kTransparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kDarkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: kAppBarTitleStyle,
        ),
      ),
      body: ListView(
        children: [
          _buildSubSettingTitle(title: "Camera"),
          SettingBar(title: "Shutdown camera"),
          SettingBar(title: "Auto restart camera"),
          SettingBar(title: "Enable Video Capture"),
          SettingBar(title: "Enable camera rotation"),
          _buildSubSettingTitle(title: "Notification"),
          SettingBar(title: "Turn-off push notifications")
        ],
      ),
    );
  }

  _buildSubSettingTitle({required String title}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: kDarkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
  }
}
