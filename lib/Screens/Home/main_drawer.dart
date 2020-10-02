// import 'package:Suraksha/Screens/ProfilePage.dart';
// import 'package:Suraksha/Screens/SplashScreen.dart';
// import 'package:Suraksha/Screens/ProfilePage.dart';
import 'package:Suraksha/Screens/Authentication/login_screen.dart';
import 'package:Suraksha/Screens/Home/details_screen.dart';
import 'package:Suraksha/Screens/ProfilePage.dart';
// import 'package:Suraksha/Screens/Home/home_screen.dart';
// import 'package:Suraksha/Screens/UserProfile/userform.dart';
// import 'package:Suraksha/Screens/ProfilePage.dart';
import 'package:Suraksha/Screens/UserProfile/user_profile.dart';
// import 'package:Suraksha/Screens/Home/home_screen.dart';
// import 'package:Suraksha/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'details_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.teal,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            // color: Theme.of(context).kPrimaryColor,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 15,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Ashok Mali',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'ashok@somegmail.com',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(DetailsScreen.routeName);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new UserProfile()),
              );

              // print("Profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context).pushNamed(DetailsScreen.routeName);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new DetailsScreen()),
              );

              // print("Profile");
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.remove('phoneNumber');
              // Navigator.of(context).pushNamed(DetailsScreen.routeName);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreenn()),
              );

              // print("Profile");
            },
          ),
        ],
      ),
    );
  }
}
