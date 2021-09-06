import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:sizer/sizer.dart';



class ViewRequestScreen extends StatefulWidget {
  const ViewRequestScreen({ Key key }) : super(key: key);

  @override
  _ViewRequestScreenState createState() => _ViewRequestScreenState();
}

class _ViewRequestScreenState extends State<ViewRequestScreen> {

  int currentIndex;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: Brightness.dark,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),

          ),
          title: Text("View Requests", style: CustomTheme.mediumText(context).copyWith(fontWeight: FontWeight.w600,),),
          
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: currentIndex == 0 ? Colors.white :primaryColor,
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 5.0,
                          offset: Offset(0, 1),
                        )
                      ]
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100.0),
                        onTap: (){},
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Pending", style: CustomTheme.normalText(context).copyWith(color: currentIndex == 0 ? Color(0xFF666666) :Colors.white, fontWeight: FontWeight.w600,),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: currentIndex == 1 ? Colors.white :primaryColor,
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 5.0,
                          offset: Offset(0, 1),
                        )
                      ]
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100.0),
                        onTap: (){

                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Rejected", style: CustomTheme.normalText(context).copyWith(color: currentIndex == 1 ? Color(0xFF666666) :Colors.white, fontWeight: FontWeight.w600,),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: currentIndex == 1 ? Colors.white : primaryColor,
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                          blurRadius: 5.0,
                          offset: Offset(0, 1),
                        )
                      ]
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100.0),
                        onTap: (){

                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Accepted", style: CustomTheme.normalText(context).copyWith(color: currentIndex == 2 ? Color(0xFF666666) :Colors.white, fontWeight: FontWeight.w600,),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}