import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';

abstract class IDadosVolleyService {
<<<<<<< HEAD
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
  Future save(DadosVolleyModel model);
=======
  Future save(DadosVolleyModel model, GameModel game);
>>>>>>> colincol
}
