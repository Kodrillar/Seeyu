import 'package:flutter/material.dart';
import 'package:seeyu/src/screens/login_screen.dart';
import 'package:seeyu/src/screens/settings.dart';
import 'package:seeyu/src/screens/sign_up_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/notification_screen.dart';
import 'src/screens/profile_screen.dart';
import 'src/screens/capture_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeeYu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.blue,
        primaryColor: Colors.blue,
        fontFamily: "Almarena",
      ),
      initialRoute: HomeScreen.routeId,
      routes: {
        HomeScreen.routeId: (context) => HomeScreen(),
        NotificationScreen.routeId: (context) => NotificationScreen(),
        ProfileScreen.routeId: (context) => ProfileScreen(),
        CaptureScreen.routeId: (context) => CaptureScreen(),
        SettingScreen.routeId: (context) => SettingScreen(),
        LoginScreen.routeId: (context) => LoginScreen(),
        SignUpScreen.routeId: (context) => SignUpScreen(),
      },
    );
  }
}
