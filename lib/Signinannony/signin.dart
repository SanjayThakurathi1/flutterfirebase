 import 'package:authicantion/Signinannony/logout.dart';
import 'package:authicantion/Signinannony/signinanony.dart';

import 'package:flutter/material.dart';


 class Signin extends StatefulWidget {
   @override
   _SigninState createState() => _SigninState();
 }
 
 class _SigninState extends State<Signin> {
   AuthService _auth = AuthService();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       
       appBar: AppBar(
         
       ),

       body: Builder(
         builder: (context) {
           return Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 RaisedButton(
                   color: Colors.amber,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(25),
                   ),
                   child: Text("SignIn Annony"),
                   onPressed: () async {
                      dynamic result = await _auth.signinannomously();
                                      if(result == null)
                                      {
                                        print("error");
                                      }
                                      else{
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut(user: result.uid,)));
                                      }
                   })
               ],
             ),
           );
         },

       ),
     );
   }
 }