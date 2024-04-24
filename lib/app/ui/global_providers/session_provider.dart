import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  final _authenticationRepository = Get.find<AuthenticationRepository>();

  void setUser(User user) {
    _user = user;
    Get.offNamed(Routes.HOME);
  }

  Future<void> signOut() async {
    await _authenticationRepository.singOut();
    _user = null;
    Get.offNamed(Routes.LOGIN);
  }
}
