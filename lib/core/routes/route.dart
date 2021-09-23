import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/core/routes/adminAuthRoute.dart';
import 'package:request/core/routes/authRoute.dart';
import 'package:request/core/routes/nonAuthRoute.dart';
import 'package:flutter/material.dart';
import 'package:request/shared/stringConst.dart';

class Auth extends StatelessWidget {
  const Auth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,
        T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
          final userAuth = watch(authState);
          return userAuth.when(
            data: (user){
              if(user == null){
                return NonAuthRoute();
              } else if(user.email == StringConst.adminEmail){
                return AdminAuthRoute();
              } else {
                return AuthRoute();
              }
            }, 
            loading: () => CircularProgressIndicator(), 
            error: (error, stack) => Text('Error occured $error'),
          );
        
          
      
    });
  }
}
