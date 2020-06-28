 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



 class LogOut extends StatefulWidget {

   LogOut({this.user});
   final String user;

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
   FirebaseAuth _auth = FirebaseAuth.instance;

   @override
   Widget build(BuildContext context) {

       return Scaffold(
        appBar: AppBar(
          title: Text("You are sucessfully Signed in"),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: <Widget>[
            RaisedButton.icon(
              label:Text("SignOut") ,
              icon: Icon(Icons.person),
              onPressed: () async{
               await _auth.signOut();
               Navigator.pop(context);
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(100),
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(" Sucessfully Signed in by uid: ${widget.user}",
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