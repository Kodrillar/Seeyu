import 'package:flutter/material.dart';
import 'package:seeyu/src/models/notification_model.dart';
import 'package:seeyu/src/screens/notificationScreen.dart';
import 'package:seeyu/src/screens/settings.dart';
import 'package:seeyu/src/services/apiBaseHelper.dart';
import 'package:seeyu/src/widgets/customBottomSheet.dart';
import '../widgets/cameraControlButon.dart';
import '../utils/constant.dart';
import '../widgets/takeActionButton.dart';
import 'captureScreen.dart';

const ASTRA_TOKEN = kAstraToken;
const URL = kUrl;

ApiBaseHelper _networkHelper = ApiBaseHelper(astraToken: kAstraToken);

class HomeScreen extends StatefulWidget {
  static const routeId = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<NotificationModel>> notification;

  getData() {
    setState(
      () {
        notification = _networkHelper.getNotifications(URL);
      },
    );
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      backgroundColor: kBackgroundColor,
      appBar: _buildAppBar(),
      body: FutureBuilder<dynamic>(
          future: notification,
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (snapshot.hasData) {
              return _buildHomeNotification(data);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Welcome",
        style: kAppBarTitleStyle,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: Padding(
          padding: const EdgeInsets.only(left: kPadding, bottom: kPadding / 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "There's an Intruder!",
                style: TextStyle(
                  fontFamily: "Almarena",
                  fontWeight: FontWeight.bold,
                  color: kDarkColor.withOpacity(.55),
                ),
              ),
            ],
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.grey),
      backgroundColor: kTransparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(kPadding / 2),
          child: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.replay),
            onPressed: () => {
              getData(),
              debugPrint("hello User!"),
            },
          ),
        ),
      ],
    );
  }

  ListView _buildHomeNotification(List<NotificationModel> notificationModel) {
    return ListView(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: kMargin, vertical: kMargin / 4),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: kDarkgreyColor.withOpacity(.22),
            //image here
            image: DecorationImage(
              image: NetworkImage(
                notificationModel[0].image!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        getTakeActionButton(),
        Container(
          height: 350,
          width: double.infinity,
          child: Column(
            children: [
              _getButtonRowOne(),
              _spacing(),
              _getButtonRowTwo(),
              _spacing(),
              _getButtonRowThree()
            ],
          ),
        )
      ],
    );
  }

  TakeActionButton getTakeActionButton() {
    return TakeActionButton(
        buttonColor: Colors.grey.withOpacity(.2),
        onPress: () {
          showModalBottomSheet(
            backgroundColor: kTransparent,
            context: (context),
            builder: (BuildContext context) => CustomBottomSheet(),
          ).whenComplete(
            () => getData(),
          );
        });
  }

  Row _getButtonRowOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _upArrowButton(),
        _rightArrowButton(),
      ],
    );
  }

  Row _getButtonRowTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _notificationButton(),
        _settingButton(),
      ],
    );
  }

  Row _getButtonRowThree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _leftArrowButton(),
        _downArrowButton(),
      ],
    );
  }

  CameraControlButton _upArrowButton() {
    return CameraControlButton(
      icon: Icons.arrow_upward,
    );
  }

  CameraControlButton _downArrowButton() {
    return CameraControlButton(
      icon: Icons.arrow_downward,
    );
  }

  CameraControlButton _leftArrowButton() {
    return CameraControlButton(
      icon: Icons.arrow_left,
    );
  }

  CameraControlButton _rightArrowButton() {
    return CameraControlButton(icon: Icons.arrow_right);
  }

  CameraControlButton _notificationButton() {
    return CameraControlButton(
      icon: Icons.notifications,
      onPressed: () {
        Navigator.pushNamed(
          context,
          NotificationScreen.routeId,
        );
      },
    );
  }

  CameraControlButton _settingButton() {
    return CameraControlButton(
      icon: Icons.settings,
      onPressed: () {
        Navigator.pushNamed(context, SettingScreen.routeId);
      },
    );
  }

  _spacing() {
    return SizedBox(
      height: kSpacing,
    );
  }

  //

  _buildBottomNavigationBar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          CaptureScreen.routeId,
        );
      },
      child: BottomAppBar(
        color: Color(0xFFEFEFEF),
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              "Capture",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.black),
        ),
      ),
    );
  }
}
