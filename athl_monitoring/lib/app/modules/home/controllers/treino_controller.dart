import 'package:athl_monitoring/app/modules/home/models/treino_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/treino_service_interface.dart';
import 'package:mobx/mobx.dart';
part 'treino_controller.g.dart';

class TreinoController = _TreinoControllerBase with _$TreinoController;

abstract class _TreinoControllerBase with Store {
  final ITreinoService treinoService;

  _TreinoControllerBase({this.treinoService});

  @observable
  int value = 0;

  @action
  save(TreinoModel model) {
    treinoService.save(model);
  }
}
