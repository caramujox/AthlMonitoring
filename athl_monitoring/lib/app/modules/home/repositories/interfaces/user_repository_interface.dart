import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository{
  Stream<List<UserModel>> get();
  Future<UserModel> index (FirebaseUser model);
  Future save(UserModel model);
  Future delete(UserModel model);
}