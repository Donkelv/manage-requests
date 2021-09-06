import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/authScreenNotifier.dart';


final authScreenProvider = StateNotifierProvider.autoDispose<AuthScreenNotifier, bool>((ref) {
  return AuthScreenNotifier();
});