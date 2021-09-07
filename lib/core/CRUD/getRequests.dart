

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User user = FirebaseAuth.instance.currentUser;
class GetRequest{

  CollectionReference reference = FirebaseFirestore.instance.collection("requests");
  

  getFailedRequests() async{
   await  reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "Failed")
    .get();
  }


  getApprovedRequests()async{
    await reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "Approved")
    .get();
  }

  getPendingRequests()async{
    await reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "pending")
    .get();
  }

  getAllRequest5() async{
    await reference
    .where("uid", isEqualTo: user.uid )
    .limit(1)
    .get();
  }

  getAllRequest() async {
   var data =  await reference
    .where("uid", isEqualTo: user.uid )
    
    .get();
    return data;
  }
}