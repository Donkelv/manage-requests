

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetRequest{

  CollectionReference reference = FirebaseFirestore.instance.collection("requests");
  User user = FirebaseAuth.instance.currentUser;

  getFailedRequests(){
    reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "Failed")
    .get();
  }


  getApprovedRequests(){
    reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "Approved")
    .get();
  }

  getPendingRequests(){
    reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "pending")
    .get();
  }

  getAllRequest5(){
    reference
    .where("uid", isEqualTo: user.uid )
    .limit(5)
    .get();
  }

  getAllRequest(){
    reference
    .where("uid", isEqualTo: user.uid )
    
    .get();
  }
}