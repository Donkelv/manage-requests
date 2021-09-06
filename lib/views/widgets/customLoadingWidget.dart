import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';


class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.white.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
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
          Text(
            "Loading..",
            style: CustomTheme.mediumText(context).copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}