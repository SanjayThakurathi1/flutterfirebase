import 'package:flutter/material.dart';
//import 'package:firebase/firebase.dart';
//import 'package:authicantion/googlelogin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Googlelogin extends StatefulWidget {
  @override
  _GoogleloginState createState() => _GoogleloginState();
}

class _GoogleloginState extends State<Googlelogin> {

  String val = "";
  String valuee="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in using google"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DropdownButton(
              items: [
              DropdownMenuItem(
                child: Text("Signin using google"),
                value: "Signin using google",
              ),
              DropdownMenuItem(
                  child: Text(
                "SignIn Using Facebook",
              ),
              value: "Signin Using fb",),
              DropdownMenuItem(child: Text("Sign in using Mobilenum"),
              value: "Sign in using Mobile num",)
            ], 
              hint:RaisedButton.icon(
                label: Text("Signin",),
                icon: Icon(FontAwesomeIcons.google),
                color: Colors.amber,
                onPressed: () {
                  /*Signin sn = Signin();
                  sn.signinusinggoogle();*/
                }),
                 onChanged: (value)
            {
              setState(() {
                val = value;
              });
            },),
            Text("$val"),
                 
            DropdownButton(items: [
              DropdownMenuItem(child: Text("Logout from fb"),
              value: "Logout from fb",
              ),
               DropdownMenuItem(child: Text("Logout from fb"),
              value: "Logout from google",
              ),
               DropdownMenuItem(child: Text("Logout from fb"),
              value: "Logout from mobile",
              ),
            ],
            hint: RaisedButton.icon(
              label: Text("Logout"),
              icon: Icon(FontAwesomeIcons.facebook),
              color: Colors.amber,
              onPressed: () {},
            ),
             onChanged: (value)
            {
              setState(() {
                 valuee = value;
              });
            }),
            Text("$valuee"),
          ],
        ),
      ),
    );
  }
}

