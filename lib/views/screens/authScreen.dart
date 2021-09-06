import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/shared/imageConst.dart';
import 'package:request/shared/themeConst.dart';
import 'package:request/views/widgets/customGoogleAuthBtn.dart';
import 'package:sizer/sizer.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "/authscreen";
  const AuthScreen({ Key key }) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: Brightness.light,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
              Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConst.welcome),
                  fit: BoxFit.contain,
                )
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0),
                    
                    Color(0xFF000000),
                  ]
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Staff Request Portal", textAlign: TextAlign.start, style: CustomTheme.largeText(context).copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consectetur purus pulvinar dignissim ut imperdiet augue quam gravida amet. Mi cras sollicitudin leo dui.", softWrap: true, textAlign: TextAlign.start, style: CustomTheme.normalText(context).copyWith(fontWeight: FontWeight.w400, color: Colors.white),),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    CustomGoogleAuthBtn(
                      function: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
        
      ),
    );
  }
}