import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/provider.dart';


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
      }).then((value) => Navigator.pop(context),);

    } catch (e) {
      context.read(authLoadProvider.notifier).notify(false);
      print(e);
    }
  }
}

