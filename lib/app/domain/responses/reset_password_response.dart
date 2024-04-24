import 'package:disruptive_studio/app/utils/app_constants.dart';

enum ResetPasswordResponse {
  ok,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  invalidEmail,
  internalError,
  tooManyRequest,
  unknown,
}

ResetPasswordResponse stringToResetPassword(String code) {
  switch (code) {
    case AppConstants.networkRequestFailed:
      return ResetPasswordResponse.networkRequestFailed;
    case AppConstants.internalError:
      return ResetPasswordResponse.internalError;
    case AppConstants.userNotFound:
      return ResetPasswordResponse.userNotFound;
    case AppConstants.userDisabled:
      return ResetPasswordResponse.userDisabled;
    default:
      return ResetPasswordResponse.unknown;
  }
}
