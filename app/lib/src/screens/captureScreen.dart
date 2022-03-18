import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({Key? key}) : super(key: key);
  static const routeId = "capture_screen";

  @override
  _CaptureScreenState createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kDarkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kTransparent,
        elevation: 0,
        title: Text(
          "Capture",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(kMargin),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kDarkColor.withOpacity(.2),
            ),
          ),
          _buildCaptureButton()
        ],
      ),
    );
  }

  _buildCaptureButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kMargin, horizontal: kMargin * 2),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kDarkColor,
        borderRadius: BorderRadius.circular(kBorderRadius / 2),
      ),
      child: Center(
        child: Text(
          "Capture",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
