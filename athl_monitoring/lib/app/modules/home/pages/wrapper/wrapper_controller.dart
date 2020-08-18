import 'package:mobx/mobx.dart';

part 'wrapper_controller.g.dart';

class WrapperController = _WrapperControllerBase with _$WrapperController;

abstract class _WrapperControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
