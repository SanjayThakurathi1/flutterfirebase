 //import 'package:authicantion/Signinannony/signinanony.dart';
import 'package:flutter/material.dart';

import '../loading.dart';

 class GoogleSign extends StatefulWidget {
   @override
   _GoogleSignState createState() => _GoogleSignState();
 }
 
 class _GoogleSignState extends State<GoogleSign> {
     //AuthService _auth = AuthService();
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
           onPressed: (){},
            
            icon: Icon(Icons.person), label: Text("Logoutt"))
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
                 //validator: EmailValidator(errorText: 'enter a valid email address'),  
         
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
               onPressed: () async{
                /* if(_keyformm.currentState.validate())
                 {
                   setState(() {
                     loading = true;
                   });
                   dynamic result = await _auth.signInwithGoogle();
                   if(result == null)
                   {
                     setState(() {
                       error = "Enter valid email and password";
                       loading= false
                       ;
                     });
                     
                   }
                   else
                   {
                     print(result.email);
                     print(result.password);
                   }
                 }
                  */
                  
               } ,
               child: Text("SignInWithEmail"),
     )]))));
   }
 }