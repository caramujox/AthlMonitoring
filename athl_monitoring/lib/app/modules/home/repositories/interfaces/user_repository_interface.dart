import 'package:athl_monitoring/app/modules/home/models/user_model.dart';

abstract class IUserRepository{
  Stream<List<UserModel>> get();
  Future<UserModel> index (UserModel model);
  Future save(UserModel model);
  Future delete(UserModel model);
}