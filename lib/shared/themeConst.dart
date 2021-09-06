import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static TextStyle largeText(BuildContext context) {
    return Theme.of(context).textTheme.headline5.copyWith(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }

  static TextStyle semiLargeText(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }

  static TextStyle mediumText(BuildContext context) {
    return Theme.of(context).textTheme.headline6.copyWith(
          fontSize: 15.0.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }

  static TextStyle normalText(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }

  static TextStyle smallText(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 10.5.sp,
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }

  static TextStyle smallestText(BuildContext context) {
    return Theme.of(context).textTheme.headline1.copyWith(
          fontSize: 9.0.sp,
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontFamily: "Poppins",
        );
  }
}