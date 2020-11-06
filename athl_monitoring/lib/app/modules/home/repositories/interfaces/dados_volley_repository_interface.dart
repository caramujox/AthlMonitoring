import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';

abstract class IDadosVolleyRepository {
  Future save(DadosVolleyModel model);

  Stream<List<DadosVolleyModel>> get();
  Stream<List<DadosVolleyModel>> getPro();
  Stream<List<DadosVolleyModel>> getCon();
  
  Stream<List<DadosVolleyModel>> getProSaque();
  Stream<List<DadosVolleyModel>> getProAtaque();
  Stream<List<DadosVolleyModel>> getProBloqueio();
  Stream<List<DadosVolleyModel>> getProErroOponente();
  Stream<List<DadosVolleyModel>> getConSaque();
  Stream<List<DadosVolleyModel>> getConAtaque();
  Stream<List<DadosVolleyModel>> getConBloqueio();
  Stream<List<DadosVolleyModel>> getConGenerico();

}
