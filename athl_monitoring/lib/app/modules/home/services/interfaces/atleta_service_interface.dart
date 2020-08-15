import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';

abstract class IAtletaService{
  Stream<List<AtletaModel>> get();
  Future save(AtletaModel model);
  Future delete(AtletaModel model);
  Future index(AtletaModel model);
}