import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/routes/routes.dart';
import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final SessionProvider _sessionProvider;

  SplashProvider(
    this._sessionProvider,
  ) {
    _init();
  }
  final AuthenticationRepository _auth = Get.find();
  String? _routeName;
  String? get routeName => _routeName;

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 2124));
    final user = await _auth.user;

    if (user == null) {
      _routeName = Routes.REGISTER;
    } else {
      _sessionProvider.setUser(user);
      _routeName = Routes.HOME;
    }
    Get.offNamed(_routeName!);
  }
}
