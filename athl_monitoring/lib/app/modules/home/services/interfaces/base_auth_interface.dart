import 'package:athl_monitoring/app/core/interfaces/base_interface.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IBaseAuth extends IBaseInterface{
  Future<FirebaseUser> signIn(String email, String password);

  Future<FirebaseUser> singInGoogle();

  Future<FirebaseUser> signUp(String email, String password, String name);

  Future<FirebaseUser> singInFacebook();

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();  
}