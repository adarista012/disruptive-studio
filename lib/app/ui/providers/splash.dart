import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';

class SplashProvider with ChangeNotifier, DiagnosticableTreeMixin {
  SplashProvider() {
    print('init');
    _init();
  }
  final AuthenticationRepository _auth = Get.find();

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 2124));
    final user = await _auth.user;
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  }
}
