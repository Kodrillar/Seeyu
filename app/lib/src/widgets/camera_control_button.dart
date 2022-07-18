import 'package:flutter/material.dart';
import '../utils/constant.dart';

class CameraControlButton extends StatelessWidget {
  const CameraControlButton({Key? key, this.icon, this.onPressed})
      : super(key: key);

  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(kPadding / 2),
        child: Container(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
