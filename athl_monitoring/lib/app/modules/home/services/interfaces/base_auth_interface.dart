import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IBaseAuth {
  Future<FirebaseUser> signIn(String email, String password);

  Future<FirebaseUser> singInGoogle();

  Future<FirebaseUser> signUp(String email, String password, String name);

  Future<FirebaseUser> singInFacebook();

  Future<FirebaseUser> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Stream<List<UserModel>> get();
  
  Future<UserModel> getUserModel();

}