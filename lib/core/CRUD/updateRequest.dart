import 'package:cloud_firestore/cloud_firestore.dart';


class UpdateRequest{
  CollectionReference reference = FirebaseFirestore.instance.collection("requests");
  approveRequest(id){
    reference.doc(id).update({
      "status": "approve",
    }).then((value) => print("user data updated"))
    .catchError((error) => print(error));
    
  }

  rejectRequest(id){
    reference.doc(id).update({
      "status": "reject",
    }).then((value) => print("user data updated"))
    .catchError((error) => print(error));
    
  }
}