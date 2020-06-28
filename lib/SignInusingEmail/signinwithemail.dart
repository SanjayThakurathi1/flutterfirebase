 
 import 'package:authicantion/SignInusingEmail/output.dart';
import 'package:authicantion/Signinannony/signinanony.dart';
import 'package:flutter/material.dart';
 import 'package:form_field_validator/form_field_validator.dart';

import '../loading.dart';
  

 class SignWithEmail extends StatefulWidget {
   SignWithEmail({this.toggle});
   final Function toggle;

   @override
   _SignWithEmailState createState() => _SignWithEmailState();
 }
 
 class _SignWithEmailState extends State<SignWithEmail> {
       bool loading = false;
      String error = "";
     final _keyformm = GlobalKey<FormState>();
     String email,password;
   @override
   Widget build(BuildContext context) {
     return loading ? Loading():Scaffold(
       appBar: AppBar(
         title: Text("SignInWithEmail"),
         actions: <Widget>[
           RaisedButton.icon(
             splashColor: Colors.amber,
             color: Colors.lightBlue,
           onPressed: ()=>
             widget.toggle()
           , icon: Icon(Icons.person), label: Text("Logot"))
         ],
       ),

       body: Form(
         key: _keyformm,
         child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             TextFormField(
               onChanged: (value) {
                 email = value;
               },
               autovalidate: true,
                 validator: EmailValidator(errorText: 'enter a valid email address'),  
         
               decoration: InputDecoration(
                 hintText: "Enter mail",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25),

                 )
               ),
             ),
             SizedBox(height: 15,),
              TextFormField(
                onChanged: (value) {
                   password =value;
                },
                obscureText: true,
                autovalidate: true,
               validator: (val) => val.length<8 ?"Enter  password with char 8+":null,
               decoration: InputDecoration(
                 
                 hintText: "Enter Password",
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(25),

                 )
               ),
             ),
             SizedBox(height: 15,),
             RaisedButton
             (
               color: Colors.lightBlue,
               splashColor: Colors.amber,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(25)
               ),
               child: Text("SignInWithEmail"),
               onPressed: () async{
                  
                    if(_keyformm.currentState.validate())
                    {
                      setState(() {
                        loading =true;
                      });
                   dynamic result= await  AuthService().signInwithEmailandPassword(email, password);

                   if(result == null)
                   {
                     setState(() {
                       error = "Enter valid Email and password";
                       loading =false;
                     });
                   }
                   else
                   {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Output(email: email,password: password,)));
                   }
                  }
                 else{
                     setState(() {
                       loading =false;
                     });
                   
                 }
               }),
               SizedBox(
                 height: 14,
               ),
               Text(error,style: TextStyle(
                   color: Colors.red,
                   fontWeight: FontWeight.bold,
               ),)
           ],
         ),
       )
        ),
     );
   }
 }