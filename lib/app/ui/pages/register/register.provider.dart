import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/domain/responses/signup_responses.dart';
import 'package:disruptive_studio/app/ui/global_providers/session_provider.dart';
import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterProvider with ChangeNotifier {
  final SessionProvider _sessionProvider;
  RegisterProvider(this._sessionProvider);
  String _email = AppConstants.empty,
      _password = AppConstants.empty,
      _passwordVerification = AppConstants.empty;
  bool _emailValidator = true;
  bool _passwordValidator = true;
  bool _passwordVerificationValidator = true;
  bool get emailValidator => _emailValidator;
  bool get passwordValidator => _passwordValidator;
  bool get passwordVerificationValidator => _passwordVerificationValidator;

  String get passwordVerification => _passwordVerification;

  String get email => _email;
  String get password => _password;
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

  void passwordVerificationValidatorChange(bool newValue) {
    _passwordVerificationValidator = newValue;
    notifyListeners();
  }

  void onEmailChanged(String text) {
    _email = text.trim();
  }

  void onPasswordChanged(String text) {
    _password = text.trim();
  }

  void onPasswordVerificationChanged(String text) {
    _passwordVerification = text.trim();
  }

  Future<SignupResponse> submit() async {
    _isLoading = true;
    notifyListeners();
    final response = await _authRepository.register(
      _email,
      _password,
    );
    if (response.error == null) {
      _sessionProvider.setUser(response.user!);
    }
    _isLoading = false;
    notifyListeners();
    return response;
  }
}
