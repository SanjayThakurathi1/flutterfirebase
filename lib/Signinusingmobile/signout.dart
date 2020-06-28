 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 class Logout extends StatefulWidget {

   Logout({this.user});
   final FirebaseUser user;

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
   

   @override
   Widget build(BuildContext context) {

       return Scaffold(
        appBar: AppBar(
          title: Text("You are sucessfully Signed in"),
          centerTitle: true,
          backgroundColor: Colors.amber,
 
        ),
        body: Container(
          padding: EdgeInsets.all(100),
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(" Sucessfully Signed in by phone number: ${widget.user.phoneNumber}",
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.black
             ),),
          ],),
        ),
       
     );
   }
}