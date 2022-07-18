import 'package:flutter/material.dart';
import 'package:seeyu/src/models/notification_model.dart';
import 'package:seeyu/src/services/api_base_helper.dart';
import 'package:seeyu/src/widgets/imageDialog.dart';
import '../utils/constant.dart';
import "../widgets/takeActionButton.dart";
import "../widgets/notificationBar.dart";

const ASTRA_TOKEN = kAstraToken;

const URL = kUrl;

ApiBaseHelper _networkHelper = ApiBaseHelper(astraToken: ASTRA_TOKEN);

class NotificationScreen extends StatefulWidget {
  static const routeId = "notification_screen";

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<NotificationModel>> notification;

  void getData() {
    setState(() {
      notification = _networkHelper.getNotifications(URL);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: _buildAppbar(),
      body: FutureBuilder<dynamic>(
        future: notification,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return _buildNotifications(data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  AppBar _buildAppbar() => AppBar(
        backgroundColor: kTransparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: kDarkColor,
        ),
        title: Text(
          "Notifications",
          style: kAppBarTitleStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.replay_outlined,
              color: kDarkColor,
            ),
            onPressed: () {
              getData();
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding, vertical: kPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Recent",
                  style: TextStyle(
                    fontFamily: "Almarena",
                    fontWeight: FontWeight.bold,
                    color: kDarkColor.withOpacity(.55),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  TakeActionButton _buildTakeActionButton({dialogImage}) => TakeActionButton(
        buttonColor: kLightcolor,
        onPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => ImageDialog(
              dialogImage: dialogImage,
            ),
          ).whenComplete(
            () => getData(),
          );
        },
      );

  ListView _buildNotifications(List<NotificationModel> notificationModel) =>
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kPadding, vertical: kPadding / 2),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildTakeActionButton(
                    dialogImage: notificationModel[1].image,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                color: kDarkgreyColor.withOpacity(.22),
                // Put Latest Notification Image here
                image: DecorationImage(
                  image: NetworkImage(notificationModel[0].image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kMargin),
            height: MediaQuery.of(context).size.height * .6,
            width: double.infinity,
            child: _buildNotificationBar(notificationModel),
          )
        ],
      );

  _buildNotificationBar(List<NotificationModel> notificationModel) =>
      ListView.builder(
        itemCount: notificationModel.length,
        itemBuilder: (context, index) => NotificationBar(
          notificationText: notificationModel[index].notification,
          time: notificationModel[index].createdAt,
          image: notificationModel[index].image,
        ),
      );
}
