import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';

class TakeActionButton extends StatelessWidget {
  TakeActionButton({this.onPress, this.buttonColor});
  final void Function()? onPress;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            "Take Action!",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: kDarkgreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
