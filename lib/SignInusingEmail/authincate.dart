
 import 'package:authicantion/SignInusingEmail/register.dart';
import 'package:authicantion/SignInusingEmail/signinwithemail.dart';
import 'package:flutter/material.dart';

class Authincate extends StatefulWidget {
  @override
  _AuthincateState createState() => _AuthincateState();
}

class _AuthincateState extends State<Authincate> {

  bool showpage = true;
  void toggle()
  {
    setState(()
    => showpage =!showpage);
      
    
  }
  @override
  Widget build(BuildContext context) {
     if(showpage == true)
     {
       return Register(toggle: toggle);
     }
     else
     {
       return SignWithEmail(toggle: toggle);
     }
  }
}