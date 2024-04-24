import 'dart:async';
import 'package:disruptive_studio/app/domain/repositories/authentication_repository.dart';
import 'package:disruptive_studio/app/domain/responses/reset_password_response.dart';
import 'package:disruptive_studio/app/domain/responses/sigin_response.dart';
import 'package:disruptive_studio/app/domain/responses/signup_responses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) async {
    // // TODO: implement sendResetPasswordLink
    return ResetPasswordResponse.userNotFound;
  }

  @override
  Future<SigninResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      return SigninResponse(
        null,
        user,
      );
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: 'Login error', content: Text(e.message!));
      return SigninResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }

  @override
  Future<void> singOut() async {
    return await _auth.signOut();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  @override
  Future<SignupResponse> register(String email, password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // print(userCredential);
      final user = userCredential.user;
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      return SignupResponse(
        null,
        userCredential.user,
      );
    } on FirebaseException catch (e) {
      Get.defaultDialog(title: 'Register error', content: Text(e.message!));
      return SignupResponse(
        parseStringToSignUpError(e.code),
        null,
      );
    }
  }
}
