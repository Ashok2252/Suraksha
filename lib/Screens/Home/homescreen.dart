import 'package:Suraksha/Screens/Home/details_screen.dart';
import 'package:Suraksha/Screens/Home/main_drawer.dart';
import 'package:Suraksha/Screens/UserProfile/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Suraksha/Camera/opencamera.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;

  HomeScreen({this.user});
  // static const routeName = '/home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // to get size
    var size = MediaQuery.of(context).size;

    // style
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.deepOrange,
        title: Text('Suraksha'),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.31,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomLeft,
                image: AssetImage('assets/images/top_header.png'),
              ),
            ),
          ),
          // Drawer: MainDrawer();
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10),
                    // margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),

                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       CircleAvatar(
                    //         radius: 32,
                    //         backgroundImage: NetworkImage(
                    //             'https://i.pinimg.com/originals/78/07/03/78070395106fcd1c3e66e3b3810568bb.jpg'),
                    //       ),
                    //       SizedBox(
                    //         width: 16,
                    //       ),
                    //       Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: <Widget>[
                    //           Text(
                    //             'John Richardo',
                    //             style: TextStyle(
                    //                 fontFamily: "Montserrat Medium",
                    //                 color: Colors.white,
                    //                 fontSize: 20),
                    //           ),
                    //           Text(
                    //             '4101410141',
                    //             style: TextStyle(
                    //                 fontSize: 14,
                    //                 color: Colors.white,
                    //                 fontFamily: "Montserrat Regular"),
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new UserProfile()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQACGFpr0iqURE_6EHYMm-AGXfhXC1Nzf4ucA&usqp=CAU',
                                  height: 128,
                                ),
                                Text(
                                  'Profile',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new CameraScreen()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://wallpapercave.com/wp/wp6976132.png',
                                  height: 128,
                                ),
                                Text(
                                  'Camera',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DetailsScreen()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRamGiruYWB-k4CTPMU8y_aXE91kIWdmrB3fw&usqp=CAU',
                                  height: 128,
                                ),
                                Text(
                                  'Emergency Contacts',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DetailsScreen()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://pngimage.net/wp-content/uploads/2018/05/features-png-5.png',
                                  height: 128,
                                ),
                                Text(
                                  'Other Features',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DetailsScreen()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSTurIJid3d_qygQU0M5oFYiAFhjub3oEOvbA&usqp=CAU',
                                  height: 128,
                                ),
                                Text(
                                  'Other Features',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new DetailsScreen()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSTurIJid3d_qygQU0M5oFYiAFhjub3oEOvbA&usqp=CAU',
                                  height: 128,
                                ),
                                Text(
                                  'Other Features',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
