import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';

abstract class IAtletaService {
  Stream<List<AtletaModel>> get(String codEquipe);
  Future save(AtletaModel model);
  Future delete(AtletaModel model);
  Future index(AtletaModel model);
  Future register(AtletaModel atletaModel, UserModel fbuser);
}
