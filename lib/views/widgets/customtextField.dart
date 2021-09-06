import 'package:flutter/material.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) function;
  const CustomTextField({ Key key, this.controller, this.function }) : super(key: key);

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
                
                validator: function,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                  border: InputBorder.none,
                  hintText: "Name",
                  hintStyle: CustomTheme.normalText(context).copyWith(fontWeight: FontWeight.w500, color: Color(0xFF666666),),
                ),
              ),
            );
  }
}