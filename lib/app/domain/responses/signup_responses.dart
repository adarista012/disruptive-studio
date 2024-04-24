import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupResponse {
  final SignupError? error;
  final User? user;

  SignupResponse(this.error, this.user);
}

enum SignupError {
  accountExistsWithDifferentCredential,
  emailAlreadyInUse,
  invalidCredential,
  weakPassword,
  networkRequestFailed,
  unknown,
}

SignupError parseStringToSignUpError(String text) {
  switch (text) {
    case AppConstants.accountExistsWithDifferentCredential:
      return SignupError.accountExistsWithDifferentCredential;
    case AppConstants.invalidCredential:
      return SignupError.invalidCredential;
    case AppConstants.networkRequestFailed:
      return SignupError.networkRequestFailed;
    case AppConstants.emailAlreadyInUse:
      return SignupError.emailAlreadyInUse;
    case AppConstants.weakPassword:
      return SignupError.weakPassword;
    case AppConstants.unknown:
      return SignupError.unknown;
    default:
      return SignupError.unknown;
  }
}
