import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';

class TakeActionOptionButton extends StatelessWidget {
  TakeActionOptionButton({
    Key? key,
    this.onTapHandler,
    this.buttonColor,
    required this.centerText,
    required this.buttonName,
    this.textColor,
  }) : super(key: key);

  final void Function()? onTapHandler;
  final String buttonName;
  final Color? buttonColor;
  final Color? textColor;
  final bool centerText;

  static const double _textPadding = kSpacing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: kMargin / 2, horizontal: kMargin),
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor == null
              ? kDarkgreyColor.withOpacity(.2)
              : buttonColor,
          borderRadius: BorderRadius.circular(kBorderRadius / 2),
        ),
        child: Padding(
          padding: centerText
              ? const EdgeInsets.only(top: _textPadding)
              : const EdgeInsets.only(left: _textPadding, top: _textPadding),
          child: Text(
            buttonName,
            textAlign: centerText ? TextAlign.center : null,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor == null ? kDarkColor : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
