import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/views/screens/staff/staffHomeScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future createAccount(String username, String email, String password, BuildContext context) async {
    try {
      context.read(authLoadProvider.notifier).notify(true);
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user.uid);
      userCredential.user.updateDisplayName(username);
      firestore.collection("users").doc(userCredential.user.uid).set({
        "username": username,
        "requests": [],
      }).then((value) {

        Navigator.pushReplacementNamed(context, StaffHomeScreen.routeName).whenComplete(() => context.read(authLoadProvider.notifier).notify(false),);
        
      });
      
    } on FirebaseAuthException catch (e) {
      context.read(authLoadProvider.notifier).notify(false);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future login(String email, String password, BuildContext context) async {
    //final admin = Hive.box(StringConst.adminBox);
    try {
      context.read(authLoadProvider.notifier).notify(true);

      // if(email == "kevinohiro@gmail.com"){
        
      //   admin.put(StringConst.adminKey, true);
      //   //Navigator.pushReplacementNamed(context, AdminHomeScreen.routeName).whenComplete(() => context.read(authLoadProvider.notifier).notify(false),);
      // } else {
      //   admin.put(StringConst.adminKey, true);
      //   //Navigator.pushReplacementNamed(context, StaffHomeScreen.routeName).whenComplete(() => context.read(authLoadProvider.notifier).notify(false),);
      // }
       
    } on FirebaseAuthException catch (e) {
      context.read(authLoadProvider.notifier).notify(false);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
