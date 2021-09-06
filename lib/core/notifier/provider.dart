import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:request/core/notifier/authScreenNotifier.dart';

final authScreenProvider =
    StateNotifierProvider.autoDispose<AuthScreenNotifier, bool>((ref) {
  return AuthScreenNotifier();
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final authState = StreamProvider<User>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});
