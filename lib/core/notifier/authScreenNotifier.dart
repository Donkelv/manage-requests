import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreenNotifier extends StateNotifier<bool> {
  AuthScreenNotifier() : super(false);

  void authScreenState(bool value) {
    state = value;
  }
}
