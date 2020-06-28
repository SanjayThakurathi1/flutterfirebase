
import 'dart:convert';

import 'package:authicantion/SignInusingEmail/authincate.dart';

import 'package:authicantion/Signinannony/signin.dart';
import 'package:authicantion/Signinannony/signinanony.dart';
import 'package:authicantion/Signinusingmobile/mobilesign.dart';
//import 'package:authicantion/Signinannony/signinanony.dart';


import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import 'loading.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'signin.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Signinmethod extends StatefulWidget {
  @override
  _SigninmethodState createState() => _SigninmethodState();
}

class _SigninmethodState extends State<Signinmethod> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
  GoogleSignInAccount _currentUser;
  String _contactText;
  AuthService _auth = AuthService();
  ConnectivityResult previous;
  bool internet = false;

  @override
  void initState() {
    super.initState();
    checkinternet();
  _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) { 
     setState(() {
       _currentUser = account;
     });
     if(_currentUser!=null)
     {
        _handleGetContact();
     }
   }
     );
     _googleSignIn.signInSilently();



  }

  
  Future<void> _handleGetContact() async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await _currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  void checkinternet() {
    try {
      InternetAddress.lookup("www.google.com").then((result) {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          //Navigator.push( context, MaterialPageRoute(builder: (context)=> Signinmethod()));
          internet = true;
        } else {
          showdialog();
        }
      }).catchError((error) {
        internet = false;
        showdialog();
      });
    } on SocketDirection catch (_) {
      internet = false;
      showdialog();
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult connresult) {
      if (connresult == ConnectivityResult.none) {
        internet = false;
        showdialog();
      } else if (previous == ConnectivityResult.none) {
        internet = true;
      }
      previous = connresult;
    });
  }

  void showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Check your internet Connection"),
        backgroundColor: Colors.white,
        elevation: 20,
        content: Text("No internet Detected"),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('Systemnavigator.pop');
              },
              child: Text(
                "Exit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  GoogleSignIn googleAuth = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return internet
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text("Signin Method"),
              centerTitle: true,
              backgroundColor: Colors.lightBlue,
            ),
            body: Builder(
                builder: (context) => Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assests/login.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton.icon(
                                splashColor: Colors.lightBlue,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Authincate()));
                                },
                                icon: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.green,
                                ),
                                label: Text("Signin with Email and Password")),
                            RaisedButton.icon(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: () {
                                 
                                },
                                icon: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                ),
                                label: Text("Signin with Facebook")),
                            RaisedButton.icon(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: ()  {
                                
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Signin()));
                                  
                                },
                                icon: Icon(
                                  FontAwesomeIcons.solidEnvelope,
                                  color: Colors.brown,
                                ),
                                label: Text("Signin with Annoy")),
                            Form(
                              child: Column(
                                children: <Widget>[],
                              ),
                            ),
                            RaisedButton.icon(
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.amber,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    content: Text(
                                      "Are u Sure",
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    action: SnackBarAction(
                                        label: "SignIn",
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Mobilelogin()));
                                        }),
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                },
                                icon: Icon(FontAwesomeIcons.mobile),
                                label: Text("Sign in with mobile num")),
                                 RaisedButton.icon(
                                splashColor: Colors.lightBlue,
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                onPressed: () async {
                                    await   _handleGetContact();},
                                
                                icon: Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.green,
                                ),
                                label: Text("Signin with Google Account")),
                          ],
                        )
                      ],
                    )),
          );
  }
}
