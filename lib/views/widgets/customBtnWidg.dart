import 'package:flutter/material.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';



class CustomBtnWidg extends StatelessWidget {
  final Color color;
  final Function function;
  final String text;
  const CustomBtnWidg({ Key key, this.color, this.function, this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: (){
            function.call();
          },
          child: Padding(
            padding: EdgeInsets.all(1.2.h),
            child: Center(
              child: Text(text, style: CustomTheme.mediumText(context).copyWith(color: Colors.white,), ),
            ),
          ),
        ),
        
      ),
      
    );
  }
}