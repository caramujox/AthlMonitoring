import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';

abstract class IAtletaService {
  Stream<List<AtletaModel>> get(List<dynamic> codEquipe);
  Future save(AtletaModel model);
  Future delete(AtletaModel model);
  Future index(AtletaModel model);
  Future register(AtletaModel atletaModel, UserModel fbuser);
  Stream<List<AtletaModel>> getFromSingleEquipe(String codEquipe);
}
