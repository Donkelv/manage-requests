import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:request/core/CRUD/getRequests.dart';
import 'package:request/shared/requestList.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customRequestWidget.dart';
import 'package:sizer/sizer.dart';


class AcceptedReq extends StatelessWidget {
  const AcceptedReq({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetRequest().getApprovedRequests(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if(snapshot.hasError){
          return Text("Something went wrong",  textAlign: TextAlign.center, style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w500,),);
        } else if(snapshot.hasData && !snapshot.data.exists){
          return Text("Hooray no pending requests", textAlign: TextAlign.center, style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w500,),);
        } else if(snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data = snapshot.data.data() as Map<String, dynamic>;
          return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CustomRequestWidget(
                            request: data[index],
                          );
                        },
                      );
        }
        return Container(
            color: Colors.transparent,
            width: 25.0.w,
            height: 25.0.w,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color(0xFF111111),
              ),
              //value: 4.0,
            ),
          );
      },
       
    );
  }
}