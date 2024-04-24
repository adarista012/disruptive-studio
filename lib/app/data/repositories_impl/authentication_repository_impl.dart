import 'dart:async';
import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/domain/responses/reset_password_response.dart';
import 'package:disruptive_studio/app/domain/responses/sigin_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();
  AuthenticationRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _auth = firebaseAuth {
    _init();
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  @override
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) {
    // TODO: implement sendResetPasswordLink
    throw UnimplementedError();
  }

  @override
  Future<SigninResponse> signInWithEmailAndPassword(
      String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> singOut() {
    // TODO: implement singOut
    throw UnimplementedError();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }
}
