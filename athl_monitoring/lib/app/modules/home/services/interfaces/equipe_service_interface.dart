import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/equipe_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';

abstract class IEquipeService{
  Stream<List<EquipeModel>> get();
  Stream<List<EquipeModel>> getEquipesDoTreinador(String uidTreinador);
  Future save(EquipeModel model);
  Future delete(EquipeModel model);
  Future index(EquipeModel model);
  Future startGame(GameModel model);
}