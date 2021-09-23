import 'package:flutter/material.dart';
import 'package:request/shared/colorConst.dart';
import 'package:request/views/screens/admin/adminHome.dart';
import 'package:sizer/sizer.dart';


class AdminAuthRoute extends StatefulWidget {
  const AdminAuthRoute({ Key key }) : super(key: key);

  @override
  _AdminAuthRouteState createState() => _AdminAuthRouteState();
}

class _AdminAuthRouteState extends State<AdminAuthRoute> {
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
        initialRoute: AdminHomeScreen.routeName,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            // case AuthScreen.routeName:
            //   return MaterialPageRoute(
            //     builder: (context) => AuthScreen(),
            //   );
           
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

