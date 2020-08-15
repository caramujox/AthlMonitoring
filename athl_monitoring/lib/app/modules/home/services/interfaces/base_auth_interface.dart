import 'package:firebase_auth/firebase_auth.dart';

abstract class IBaseAuth {
  Future<FirebaseUser> signIn(String email, String password);

  Future<FirebaseUser> singInGoogle();

  Future<FirebaseUser> signUp(String email, String password);

  Future<FirebaseUser> singInFacebook();

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();
}