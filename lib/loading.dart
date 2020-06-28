 
 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Container(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
              SpinKitCircle(color: Colors.lightBlue,
              size: 50,),
              SizedBox(height: 10,),
              Text("Connecting...",
              style: TextStyle(
                decoration: TextDecoration.none,//IT REMOVE UNDERLINE YELLOW LINE
                textBaseline: null,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              )

           ],
         ),
       );
     
   }
 }