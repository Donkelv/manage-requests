import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/views/screens/admin/adminHome.dart';
import 'package:request/views/screens/staff/newRequestScreen.dart';
import 'package:request/views/screens/staff/staffHomeScreen.dart';
import 'package:request/views/screens/staff/viewRequestScreen.dart';
import 'package:sizer/sizer.dart';

class AuthRoute extends StatefulWidget {
  const AuthRoute({Key key}) : super(key: key);

  @override
  _AuthRouteState createState() => _AuthRouteState();
}

class _AuthRouteState extends State<AuthRoute> {


  //final admin = Hive.box(StringConst.adminBox);
  // bool adminVal;
  // @override
  // void initState() { 
  //   super.initState();
  //   adminVal = admin.get(StringConst.adminKey);
  // }
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
              case AdminHomeScreen.routeName:
              return MaterialPageRoute(
                builder: (context) => AdminHomeScreen(),
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
