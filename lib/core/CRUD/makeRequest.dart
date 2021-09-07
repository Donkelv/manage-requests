import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/views/screens/staff/viewRequestScreen.dart';


class MakeRequest{
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference reference = FirebaseFirestore.instance.collection("requests");
  

  Future makeRequest(String name, String category, String department, String message, BuildContext context) async{
    try {
      context.read(authLoadProvider.notifier).notify(true);
      reference.doc().set({
        "uid": user.uid,
        "title": name,
        "category": category,
        "department": department,
        "message": message,
        "status": "pending",
        "date": DateTime.now(),
      }).then((value) => Navigator.pushNamed(context, ViewRequestScreen.routeName)).whenComplete(() => context.read(authLoadProvider.notifier).notify(false),);
      // reference.doc(user.uid).update({
      //   "requests": FieldValue.arrayUnion([
      //     {
      //       "title": name,
      //       "category": category,
      //       "department": department,
      //       "message": message,
      //       "status": "pending",
      //     }
      //   ])
      // }).then((value) => Navigator.pushNamed(context, ViewRequestScreen.routeName)).whenComplete(() => context.read(authLoadProvider.notifier).notify(false),);
     // .whenComplete(() => );
    } catch (e) {
      context.read(authLoadProvider.notifier).notify(false);
      print(e);
    }
  }
}

