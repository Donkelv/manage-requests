import 'package:flutter/material.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) function;
  final int minLine;
  final int maxLine;
  final bool padding;
  const CustomTextField(
      {Key key,
      this.controller,
      this.function,
      this.hintText,
      this.minLine,
      this.maxLine,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 1),
            blurRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        minLines: minLine == null ? 1 : minLine,
        maxLines: maxLine == null ? 1 : maxLine,
        validator: function,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: padding == false
              ? EdgeInsets.symmetric(horizontal: 4.0.w)
              : EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 2.0.h),
          border: InputBorder.none,
          hintText: "$hintText",
          hintStyle: CustomTheme.normalText(context).copyWith(
            fontWeight: FontWeight.w500,
            color: Color(0xFF666666),
          ),
        ),
      ),
    );
  }
}
