import 'package:Suraksha/Screens/Home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Suraksha/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:Suraksha/Screens/Home/home_screen.dart';
import './background.dart';
import 'package:Suraksha/components/rounded_button.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final _countryCode = '+91';

  Future<void> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    // await Firebase.initializeApp();

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = (await _auth.signInWithCredential(credential));

          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  user: user,
                ),
              ),
            );
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done automaticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
          // throw (exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
            context: context,
            barrierDismissible: false,
            // Firebase.initializeApp(),
            builder: (context) {
              return AlertDialog(
                title: Text("Enter the OTP"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  Container(
                    child: RoundedButton(
                      text: ("Submit"),
                      textColor: Colors.white,
                      color: kPrimaryColor,
                      press: () async {
                        print("login button pressed");
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            // ignore: deprecated_member_use
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                user: user,
                              ),
                            ),
                          );
                        } else {
                          print("Error");
                        }
                      },
                    ),
                  )
                ],
              );
            },
          );
        },
        codeAutoRetrievalTimeout: null);
  }

// The above given code is the main Logic for OTP Validation via Firebase by Ashok Mali ( Github Ashok9589 )

// ****************************************************************************************

//Sample UI

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Enter Your Mobile Number",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            Image.asset('assets/images/logo3.png'),
            SizedBox(height: size.height * 0.05),
            Container(
              width: 290,
              padding: EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                decoration: InputDecoration(hintText: 'Mobile Number'),
                controller: _phoneController,
              ),
            ),
            Container(
              child: RoundedButton(
                text: "LOGIN",
                press: () async {
                  print("Login Button Pressed");
                  final phone = _phoneController.text.trim();
                  loginUser(_countryCode + phone, context);
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // prefs.setString('email', 'useremail@gmail.com');
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext ctx) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
