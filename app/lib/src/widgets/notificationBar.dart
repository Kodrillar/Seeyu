import 'package:flutter/material.dart';
import 'package:seeyu/src/utils/constant.dart';

import 'customBottomSheet.dart';

class NotificationBar extends StatelessWidget {
  NotificationBar({Key? key, this.notificationText, this.time, this.image})
      : super(key: key);

  final String? notificationText;
  final String? time;
  final String? image;

  String getDateInTimeAgo() {
    const int minimumTimeAgo = 1;
    DateTime dateTimeToBeConverted = DateTime.parse(time!);
    Duration differenceInDateTime =
        DateTime.now().difference(dateTimeToBeConverted);
    if (differenceInDateTime.inDays >= minimumTimeAgo) {
      return "${differenceInDateTime.inDays} day(s) ago";
    } else if (differenceInDateTime.inHours >= minimumTimeAgo)
      return "${differenceInDateTime.inHours} hour(s) ago";
    else if (differenceInDateTime.inMinutes >= minimumTimeAgo)
      return "${differenceInDateTime.inMinutes} minute(s) ago";
    else if (differenceInDateTime.inSeconds >= minimumTimeAgo)
      return "${differenceInDateTime.inSeconds} second(s) ago";
    else
      return "just now";
  }

  @override
  Widget build(BuildContext context) {
    getDateInTimeAgo();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: kTransparent,
          context: (context),
          builder: (BuildContext context) => CustomBottomSheet(),
        );
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: kMargin, vertical: kMargin / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: kLightcolor,
        ),
        height: 90,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding / 2),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: kDarkgreyColor.withOpacity(.22),
                backgroundImage: NetworkImage(
                  image!,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    notificationText!,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.5,
                ),
                Text(
                  getDateInTimeAgo(),
                  style: TextStyle(
                    fontSize: 12,
                    color: kDarkgreyColor.withOpacity(.75),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
