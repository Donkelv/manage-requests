import 'package:flutter/material.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/views/screens/authScreen.dart';
import 'package:request/views/screens/staff/newRequestScreen.dart';
import 'package:request/views/screens/staff/staffHomeScreen.dart';
import 'package:request/views/screens/staff/viewRequestScreen.dart';
import 'package:sizer/sizer.dart';

class AuthRoute extends StatelessWidget {
  const AuthRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        title: "Request Portal",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: primarySwatch,
          primaryColor: primaryColor,
          fontFamily: "Inter",
        ),
        initialRoute: StaffHomeScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            // case AuthScreen.routeName:
            //   return MaterialPageRoute(
            //     builder: (context) => AuthScreen(),
            //   );
            //   break;
            case StaffHomeScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => StaffHomeScreen(),
              );
              break;
            case NewRequestScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => NewRequestScreen(),
              );
              break;
            case ViewRequestScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => ViewRequestScreen(),
              );
              break;
            default:
              return null;
          }
        },
      );
    });
  }
}
