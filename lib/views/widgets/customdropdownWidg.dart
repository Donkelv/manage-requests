import 'package:flutter/material.dart';
import 'package:request/shared/imageConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CustomDropDownWidg extends StatefulWidget {
  final String hintText;
  final String selectedValue;
  final Function(String) onChanged;
  final List<String> list;
  const CustomDropDownWidg(
      {Key key, this.hintText, this.selectedValue, this.onChanged, this.list})
      : super(key: key);

  @override
  _CustomDropDownWidgState createState() => _CustomDropDownWidgState();
}

class _CustomDropDownWidgState extends State<CustomDropDownWidg> {
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Padding(
            padding: EdgeInsets.only(left: 5.0.w),
            child: Text(
              "${widget.hintText}",
              style: CustomTheme.normalText(context).copyWith(
                fontWeight: FontWeight.w500,
                color: Color(0xFF666666),
              ),
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: WebsafeSvg.asset(
              ImageConst.caretDownIcon,
              color: Color(0xFF666666),
            ),
          ),
          items: widget.list.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Text(
                  value,
                  style: CustomTheme.normalText(context),
                ),
              ),
            );
          }).toList(),
          value: widget.selectedValue,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
