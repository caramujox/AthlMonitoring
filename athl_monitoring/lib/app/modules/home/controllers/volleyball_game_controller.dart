import 'package:mobx/mobx.dart';

part 'volleyball_game_controller.g.dart';

class VolleyballGameController = _VolleyballGameControllerBase
    with _$VolleyballGameController;

abstract class _VolleyballGameControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
