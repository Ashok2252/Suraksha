import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:intl/intl.dart';

class UserProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserProfileState();
  }
}

class UserProfileState extends State<UserProfile> {
  String _name;
  String _lastname;
  String _email;
  String _phoneNumber;

  // String _dob;
  String _address;
  String _city;
  String _state;

  // String _password;
  // String _url;

  bool _autovalidate = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // DateTime _selectedDate;

// ***************************SENDING DATA TO FIREBASE*******************************************

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      DatabaseReference ref = FirebaseDatabase.instance.reference();
      var data = {
        "First Name": _name,
        "Last Name": _lastname,
        "Email Address": _email,
        "Contact Number": _phoneNumber,
        "Address": _address,
        "City": _city,
        "State": _state,
      };
      ref.child('User-Data').push().set(data);
      // .then((v) {
      //   _key.currentState.reset();
      // });
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

// **************************SENDING DATA TO FIREBASE*******************************************

  Widget _buildName() {
    return TextFormField(
      // autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        labelText: 'First Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.teal,
        ),
      ),
      // SizedBox(height: 25.0,),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'Last Name',
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.teal,
        ),
      ),

      // maxLength: 10,
      showCursor: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _lastname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'Email Address',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.teal,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'Mobile Number',
        prefixIcon: Icon(
          Icons.phone_iphone,
          color: Colors.teal,
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'Your Address',
        prefixIcon: Icon(
          Icons.place,
          color: Colors.teal,
        ),
      ),
      // maxLength: 50,
      showCursor: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  Widget _buildCity() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'City',
        prefixIcon: Icon(
          Icons.location_city,
          color: Colors.teal,
        ),
      ),
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'City is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _city = value;
      },
    );
  }

  Widget _buildState() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(width: 1, color: Colors.teal),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: 'State',
        prefixIcon: Icon(
          Icons.blur_on,
          color: Colors.teal,
        ),
      ),
      keyboardType: TextInputType.name,
      validator: (String value) {
        if (value.isEmpty) {
          return 'State is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _state = value;
      },
    );
  }

// ************************ DATE OF BIRTH ******************************

  // Widget _buildDOB() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       enabledBorder: OutlineInputBorder(
  //         borderSide: BorderSide(color: Colors.black, width: 1.0),
  //       ),
  //       labelText: 'Date Of Birth',
  //       prefixIcon: Icon(
  //         Icons.calendar_today,
  //         color: Colors.red,
  //       ),
  //     ),

  //     onTap: _presentDatePicker,

  //     validator: (String _selectedDate) {
  //       if (_selectedDate.isEmpty) {
  //         return 'Date Of Birth Cannot be Empty';
  //       }
  //       return _selectedDate.toString();
  //     },
  //     onSaved: (String _selectedDate) {
  //       _dob = _selectedDate;
  //     },
  //   );
  // }

  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1950),
  //     lastDate: DateTime.now(),
  //   ).then((pickedDate) {
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   });

  //   print('...');
  // }

// ************************ DATE OF BIRTH ******************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(24),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildName(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      _buildLastName(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      _buildEmail(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      // _buildPassword(),
                      // _builURL(),
                      _buildPhoneNumber(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),

                      // _buildDOB(),
                      // Padding(
                      //   padding: EdgeInsets.all(10),
                      // ),

                      _buildAddress(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),

                      _buildCity(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),

                      _buildState(),
                      Padding(
                        padding: EdgeInsets.all(10),
                      ),

                      SizedBox(height: 10),

                      RaisedButton(
                          color: Colors.deepOrange,
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: _sendToServer
                          // () {
                          //   if (!_key.currentState.validate()) {
                          //     return;
                          //   }

                          // _key.currentState.save();

                          // print(_name);
                          // print(_lastname);
                          // print(_email);
                          // print(_phoneNumber);
                          // // print(_dob);
                          // print(_address);
                          // print(_city);
                          // print(_state);

                          //Send to API
                          // },
                          )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
