import 'package:Suraksha/Screens/Authentication/login_screen.dart';
import 'package:Suraksha/Screens/ProfilePage.dart';
import 'package:Suraksha/Screens/SplashScreen/SplashScreen.dart';
import 'package:Suraksha/constant.dart';
import 'package:flutter/material.dart';

import 'Screens/Home/homescreen.dart';

main() {
  runApp(
    new MaterialApp(
      title: 'Suraksha  ',
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        LOGIN_SCREEN: (BuildContext context) => new LoginScreenn(),
      },
    ),
  );
}
