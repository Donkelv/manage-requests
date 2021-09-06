import 'package:flutter_riverpod/flutter_riverpod.dart';


class AuthLoaderNotifier extends StateNotifier<bool> {
  AuthLoaderNotifier(): super(false);

  void notify(bool value){
    state = value; 
  }
  
}