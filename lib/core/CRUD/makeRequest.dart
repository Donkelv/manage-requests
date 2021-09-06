import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MakeRequest{
  User user = FirebaseAuth.instance.currentUser;
  CollectionReference reference = FirebaseFirestore.instance.collection("users");
  

  Future makeRequest(String name, String category, String department, String message) async{
    try {
      reference.doc(user.uid).update({
        "requests": FieldValue.arrayUnion([
          {
            "title": name,
            "category": category,
            "department": department,
            "message": message,
          }
        ]),
      });
    } catch (e) {

      print(e);
    }
  }
}

