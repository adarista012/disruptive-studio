import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/domain/responses/sigin_response.dart';
import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginProvider with ChangeNotifier {
  final SessionProvider _sessionProvider;
  LoginProvider(this._sessionProvider);
  String _email = AppConstants.empty, _password = AppConstants.empty;
  bool _emailValidator = true;
  bool _passwordValidator = true;
  bool get emailValidator => _emailValidator;
  bool get passwordValidator => _passwordValidator;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _authRepository = Get.find<AuthenticationRepository>();

  void emailValidatorChange(bool newValue) {
    _emailValidator = newValue;
    notifyListeners();
  }

  void passwordValidatorChange(bool newValue) {
    _passwordValidator = newValue;
    notifyListeners();
  }

  void onEmailChanged(String text) {
    _email = text.trim();
  }

  void onPasswordChanged(String text) {
    _password = text.trim();
  }

  Future<SigninResponse?> signinWithEmailAndPassword() async {
    _isLoading = true;
    notifyListeners();
    final response = await _authRepository.signInWithEmailAndPassword(
      _email,
      _password,
    );
    if (response.error == null) {
      _sessionProvider.setUser(
        response.user!,
      );
    }
    _isLoading = false;
    notifyListeners();

    return response;
  }
}
