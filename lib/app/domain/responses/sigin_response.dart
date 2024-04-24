import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninResponse {
  final SigninError? error;
  final User? user;

  SigninResponse(this.error, this.user);
}

enum SigninError {
  accountExistsWithDifferentCredential,
  invalidCredential,
  cancelled,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequest,
  unknown,
}

SigninError stringToSignInError(String code) {
  switch (code) {
    case AppConstants.accountExistsWithDifferentCredential:
      return SigninError.accountExistsWithDifferentCredential;
    case AppConstants.invalidCredential:
      return SigninError.invalidCredential;
    case AppConstants.networkRequestFailed:
      return SigninError.networkRequestFailed;
    case AppConstants.userDisabled:
      return SigninError.userDisabled;
    case AppConstants.userNotFound:
      return SigninError.userNotFound;
    case AppConstants.wrongPassword:
      return SigninError.wrongPassword;
    case AppConstants.tooManyRequest:
      return SigninError.tooManyRequest;
    default:
      return SigninError.unknown;
  }
}
