import 'package:flutter/material.dart';
import '../utils/constant.dart';

class SettingBar extends StatefulWidget {
  SettingBar({
    Key? key,
    required this.title,
    // required this.onPressed,
  }) : super(key: key);

  final String title;
  // Function onPressed;

  @override
  _SettingBarState createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
  bool iconStatus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      height: 45,
      color: kLightcolor,
      child: InkWell(
        highlightColor: Colors.grey.withOpacity(.4),
        onTap: () {
          // widget.onPressed();
          setState(() {
            iconStatus = !iconStatus;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: kDarkgreyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(iconStatus
                  ? Icons.check_circle_outline
                  : Icons.cancel_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
