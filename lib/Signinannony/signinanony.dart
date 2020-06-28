
import 'package:authicantion/Signinannony/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService
{

  String email ="";
  String password = "";
  
 
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();


   //auth change user stream
   Stream<User> get user{
     return _auth.onAuthStateChanged.map((FirebaseUser user) => _userformfirebaseuser(user));//mapping Firebaseuser to our own custom user
   }
    //create a user object based on Firebase User
    
   User _userformfirebaseuser(FirebaseUser user)
   {
     return user!= null ? User(uid: user.uid):null;
   }
 

   Future signinannomously() async
   {   try{
      AuthResult result = await _auth.signInAnonymously();
       FirebaseUser user = result.user;
       //return user;
       //now we returnabovefxn
        return _userformfirebaseuser(user);
       //now we should retun custemuserobject instead of Firebase
   } catch(e)
   {
     print(e.toString());
   }
      
   }


   //Sign in with Emailand Password

  Future  signinwithemailandpassword(String email, String password) async
  {
    try
    {
         AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
         FirebaseUser user =result.user;
         return (user);
    }
    catch(e)
    {
            print(e.toString());
            return null;
    }
  }


  // Register in using Email and Password
  Future registerWithEmailAndPassword(String email, String password) async
  {
      try{
        dynamic result  = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userformfirebaseuser(user);
      }
      catch(e)
      {
        print(e.toString());
        return null;
      }
  }

  Future signInwithEmailandPassword(String email, String password) async
  { try
  {
     dynamic result =  await  _auth.signInWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userformfirebaseuser(user);
  }
  catch(e)
  {
    print(e.toString());
  }
     

  }

  //Sign in with google
  Future signInwithGoogle() async
  {  try
  {
    final GoogleSignInAccount googleSignInAccount =  await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential =  GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    final AuthResult result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;
    return user;
  }
  catch(e)
  {
    print(e.toString());
  }
    
  }


  //Signout from google



}