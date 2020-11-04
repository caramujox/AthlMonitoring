import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';

abstract class IDadosVolleyRepository {
  Future save(DadosVolleyModel model, GameModel game);
}
