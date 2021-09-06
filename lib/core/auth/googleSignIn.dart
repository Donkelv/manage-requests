import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:request/views/screens/staff/staffHomeScreen.dart';


class Auth{
  Future<UserCredential> signInWithGoogle(context) async{
    // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  
  
  // Once signed in, return the UserCredential
 await FirebaseAuth.instance.signInWithCredential(credential)
 .then((value){
   Navigator.pushNamed(context, StaffHomeScreen.routeName);
   //return value.credential;
 })
 .onError<FirebaseAuthException>((error, _){
  throw error.message;
 });
}
}