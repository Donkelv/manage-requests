import 'package:flutter/material.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/views/screens/authScreen.dart';
import 'package:request/views/screens/staff/staffHomeScreen.dart';
import 'package:sizer/sizer.dart';



class NonAuthRoute extends StatefulWidget {
  const NonAuthRoute({ Key key }) : super(key: key);

  @override
  _NonAuthRouteState createState() => _NonAuthRouteState();
}

class _NonAuthRouteState extends State<NonAuthRoute> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType){
            return MaterialApp(
        title: "Request Portal",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primarySwatch,
          primaryColor: primaryColor,
          fontFamily: "Inter",
        ),
        initialRoute: AuthScreen.routeName,
        onGenerateRoute: (settings){
          switch (settings.name) {
            case AuthScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => AuthScreen(),);
              break;
             case StaffHomeScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => StaffHomeScreen(),);
              break;
            default:
            return null;
          }
        },
      );
          }
      
    );
  }
}