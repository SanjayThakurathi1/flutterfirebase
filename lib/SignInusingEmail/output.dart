import 'package:authicantion/SignInusingEmail/register.dart';
import 'package:authicantion/Signinannony/signin.dart';
import 'package:flutter/material.dart';

class Output extends StatefulWidget {
  Output({this.email, this.password});
  final String email;
  final String password;
  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home"),
        actions: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: RaisedButton.icon(
                
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
                icon: Icon(Icons.person),
                label: Text("SignIn")),
          ),
                  SizedBox(width: 100,), 
          Align(
            alignment: Alignment.topRight,
                      child: RaisedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                icon: Icon(Icons.person),
                label: Text("Register")),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" Email address = ${widget.email}"),
              SizedBox(height: 20,),
              Text(" with password = ${widget.password}"),
            ],
          ),
        ),
      ),
    );
  }
}
