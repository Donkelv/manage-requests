import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:request/shared/imageConst.dart';
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
          ],
        ),
        
      ),
    );
  }
}