import 'package:disruptive_studio/app/domain/responses/reset_password_response.dart';
import 'package:disruptive_studio/app/domain/responses/sigin_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> singOut();

  Future<SigninResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}
