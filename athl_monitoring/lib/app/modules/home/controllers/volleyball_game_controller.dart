import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/models/game_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/dadosVolley_service_interface.dart';
import 'package:mobx/mobx.dart';

part 'volleyball_game_controller.g.dart';

class VolleyballGameController = _VolleyballGameControllerBase
    with _$VolleyballGameController;

abstract class _VolleyballGameControllerBase with Store {
  final IDadosVolleyService dadosVolleyService;

  @observable
  int value = 0;

  _VolleyballGameControllerBase({this.dadosVolleyService});

  @action
  void increment() {
    value++;
  }

  @action
  save(DadosVolleyModel model, GameModel game) {
    dadosVolleyService.save(model, game);
  }
}
