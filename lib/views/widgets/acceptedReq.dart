import 'package:flutter/material.dart';
import 'package:request/shared/requestList.dart';
import 'package:request/views/widgets/customRequestWidget.dart';
import 'package:sizer/sizer.dart';


class AcceptedReq extends StatelessWidget {
  const AcceptedReq({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: requestList.length,
                      itemBuilder: (context, index) {
                        return CustomRequestWidget(
                          request: requestList[index],
                        );
                      },
                    );
  }
}