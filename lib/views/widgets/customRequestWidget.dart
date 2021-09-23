import 'package:flutter/material.dart';
import 'package:request/core/CRUD/updateRequest.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CustomRequestWidget extends StatelessWidget {
  final request;
  final level;
  final String id;
  final String status;
  CustomRequestWidget({Key key, this.request, this.level, this.id, this.status}) : super(key: key);

DateFormat dateFormat = DateFormat('y-MM-d');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0.h),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 15.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.0.h),
              child: ExpansionTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          request['title'],
                          style: CustomTheme.normalText(context).copyWith(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF666666),
                          ),
                        ),
                        Text(
                          request['status'],
                          style: CustomTheme.smallText(context).copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${dateFormat.format(request['date'].toDate())}",
                      style: CustomTheme.smallText(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       level == "admin" && status == "pending" ? Text("Department: ${request['department']}", style: CustomTheme.smallText(context).copyWith(color: Color(0xFF666666), fontWeight: FontWeight.w500), ): SizedBox(height: 0,),
                      // SizedBox(
                      //   height: 1.0.h,
                      // ),
                      // level == "admin" && status == "pending" ? Text("Name: ${request['username']}", style: CustomTheme.smallText(context).copyWith(color: Color(0xFF666666), fontWeight: FontWeight.w500), ): SizedBox(height: 0,),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Text("${request['message']}", style: CustomTheme.smallText(context).copyWith(color: Color(0xFF666666), fontWeight: FontWeight.w400), ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      level == "admin" && status == "pending" ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: (){
                              UpdateRequest().approveRequest(id);
                            }, 
                            child: Text("Approve", style: CustomTheme.smallText(context).copyWith(color:  Colors.green,),),),

                            SizedBox(
                              width: 3.0.w,
                            ),
                            TextButton(
                            onPressed: (){
                              UpdateRequest().rejectRequest(id);
                            }, 
                            child: Text("Reject", style: CustomTheme.smallText(context).copyWith(color:  Colors.red,),),),
                        ],
                      )
                      :
                      SizedBox(
                        height: 0.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
