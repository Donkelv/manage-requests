import 'package:flutter/material.dart';
import 'package:request/shared/imageConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CustomGoogleAuthBtn extends StatelessWidget {
  final Function function;
  const CustomGoogleAuthBtn({Key key, @required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            function.call();
          },
          child: Padding(
            padding: EdgeInsets.all(1.2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageConst.googleIconPng),
                SizedBox(
                  width: 2.0.w,
                ),
                Text(
                  "Join with Google",
                  style: CustomTheme.mediumText(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
