import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SplashProvider with ChangeNotifier, DiagnosticableTreeMixin {
  SplashProvider() {
    print('init');
    _init();
  }

  void _init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
