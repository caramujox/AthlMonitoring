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
}
