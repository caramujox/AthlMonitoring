import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';

abstract class IEquipeRepository{
  Stream<List<EquipeModel>> get();
  Future<EquipeModel> index(EquipeModel equipeModel);
  Future save(EquipeModel equipeModel);
  Future delete(EquipeModel equipeModel);
}