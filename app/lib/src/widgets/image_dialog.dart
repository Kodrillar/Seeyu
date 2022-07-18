import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';
import 'package:seeyu/src/widgets/take_action_option_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({Key? key, required this.dialogImage}) : super(key: key);
  final String dialogImage;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height * .8;

    return Dialog(
      backgroundColor: kTransparent,
      child: Container(
        height: _height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius + 10),
          color: kLightcolor,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(kMargin),
              width: double.infinity,
              height: _height * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: kDarkgreyColor.withOpacity(.22),
                  image: DecorationImage(
                    image: NetworkImage(dialogImage),
                    fit: BoxFit.cover,
                  )),
            ),
            TakeActionOptionButton(
              centerText: false,
              buttonName: "Toggle Alarm!",
            ),
            TakeActionOptionButton(
              centerText: false,
              buttonName: "Call 911",
              onTapHandler: () {
                dialPolice("911");
              },
            ),
          ],
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
