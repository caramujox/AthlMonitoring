import 'package:athl_monitoring/app/modules/home/models/user_model.dart';

abstract class IBaseInterface{
  Stream<List<UserModel>> get();
  UserModel getUserInfo();
}