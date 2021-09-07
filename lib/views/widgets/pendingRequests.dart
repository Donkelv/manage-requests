import 'package:flutter/material.dart';
import 'package:request/shared/requestList.dart';
import 'package:request/views/widgets/customRequestWidget.dart';
import 'package:sizer/sizer.dart';


class PendingRequests extends StatelessWidget {
  const PendingRequests({ Key key }) : super(key: key);

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