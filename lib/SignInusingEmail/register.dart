import 'package:authicantion/SignInusingEmail/output.dart';
import 'package:authicantion/Signinannony/signinanony.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  Register({this.toggle});
  final Function toggle;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
     bool loading = true;
    AuthService _auth = AuthService();
    String email,password;
    String error = "";
   final _keyformm = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         title: Text("RegisternWithEmail"),
         actions: <Widget>[
           RaisedButton.icon(onPressed: ()=>
             widget.toggle(),
            icon: Icon(Icons.person), label: Text("Login"))
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
                email= value;
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
                  onChanged: (value) => password = value,
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
               child: Text("RegisterWithEmail"),
               onPressed: (){

                
                 if(_keyformm.currentState.validate())  // it sees that all the requirement are fullfilled or not if return true:false
                 {  
                    setState(() {
                      loading = true;
                    });
                   dynamic result =  _auth.registerWithEmailAndPassword(email, password);
                   if(result==null)
                   {
                     setState(() {
                       error = "Enter a valid email ";
                       loading = false;
                     });
                   }
                   else{
                       setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Output(email: email,password: password,)));
                       });
                   }
                   
               }

               }),
               SizedBox(height: 15,),
               Text(error,style: TextStyle(
                 color: Colors.red,
                 fontSize: 14,
                 fontWeight: FontWeight.bold
               ),)

                 
                    
           ],
         ),
       )
        ),
     );
  }
}