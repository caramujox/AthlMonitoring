import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';

abstract class IDadosVolleyService {
  Stream<List<DadosVolleyModel>> get();
  Future save(DadosVolleyModel model);
}
