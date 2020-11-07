import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';

abstract class IAtletaRepository {
  Stream<List<AtletaModel>> get(String codEquipe);
  Future<AtletaModel> index(AtletaModel model);
  Future save(AtletaModel atletaModel);
  Future delete(AtletaModel atletaModel);
  Future register(AtletaModel atletaModel, UserModel fbuser);
}
