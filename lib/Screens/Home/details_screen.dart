import 'package:Suraksha/Screens/Home/homescreen.dart';
import 'package:flutter/material.dart';

import './main_drawer.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Features'),
        backgroundColor: Colors.teal,
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Features will be shown here",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(Icons.arrow_back_ios),
              backgroundColor: Colors.deepOrange,
              onPressed: () {
                print("Button Presssed");
                // Navigator.of(context).pushNamed(HomeScreenn.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
