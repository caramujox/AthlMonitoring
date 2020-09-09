import 'package:mobx/mobx.dart';
part 'image_caputre_controller.g.dart';

class ImageCaputreController = _ImageCaputreControllerBase
    with _$ImageCaputreController;

abstract class _ImageCaputreControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

}
