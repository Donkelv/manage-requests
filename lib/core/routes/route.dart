import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/provider.dart';
import 'package:request/core/routes/authRoute.dart';
import 'package:request/core/routes/nonAuthRoute.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context,
        T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
      if (watch(authState).data.value != null) {
        if (watch(authState).data.value.email == "kevinohiro@gmail.com") {
          return AuthRoute();
        } else {
          return AuthRoute();
        }
      } else {
        return NonAuthRoute();
      }
    });
  }
}
