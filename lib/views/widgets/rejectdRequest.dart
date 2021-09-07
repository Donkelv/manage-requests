import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:request/core/CRUD/getRequests.dart';
import 'package:request/shared/requestList.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customRequestWidget.dart';
import 'package:sizer/sizer.dart';


class RejectdRequest extends StatelessWidget {
  const RejectdRequest({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: reference
    .where("uid", isEqualTo: user.uid )
    .where("status", isEqualTo: "Rejected")
    .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Something went wrong",  textAlign: TextAlign.center, style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w500,),);
        } else if(!snapshot.hasData){
          return Text("Hooray no Rejected requests", textAlign: TextAlign.center, style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w500,),);
        } else if(snapshot.connectionState == ConnectionState.done){
          final List<DocumentSnapshot> documents = snapshot.data.docs;
          
          return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          return CustomRequestWidget(
                            request: documents[index].data(),
                          );
                        },
                      );
        } else {
        return Center(
          child: Container(
              color: Colors.transparent,
              width: 25.0.w,
              height: 25.0.w,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Color(0xFF111111),
                ),
                //value: 4.0,
              ),
            ),
        );
        }
      },
       
    );
  }
}