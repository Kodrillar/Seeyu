import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';
import 'package:seeyu/src/widgets/take_action_option_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({Key? key}) : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BottomSheet(
      backgroundColor: kTransparent,
      onClosing: () {},
      builder: (BuildContext context) => Container(
        height: _height * .6,
        decoration: BoxDecoration(
          color: kLightcolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: ListView(
            children: [
              TakeActionOptionButton(
                buttonName: "Toggle Alarm!",
                centerText: false,
              ),
              TakeActionOptionButton(
                buttonName: "Call 911",
                centerText: false,
                onTapHandler: () {
                  dialPolice("911");
                },
              ),
              TakeActionOptionButton(
                buttonName: "Ignore",
                buttonColor: kDarkColor,
                textColor: kLightcolor,
                centerText: true,
                onTapHandler: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dialPolice(phoneNumber) async {
    final url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    }

    return;
  }
}
