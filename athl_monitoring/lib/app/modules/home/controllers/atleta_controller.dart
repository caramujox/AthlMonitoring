import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/atleta_service_interface.dart';
import 'package:mobx/mobx.dart';
part 'atleta_controller.g.dart';

class AtletaController = _AtletaControllerBase with _$AtletaController;

abstract class _AtletaControllerBase with Store {
  final IAtletaService atletaService;

  _AtletaControllerBase({IAtletaService this.atletaService}) {
   getList();
  }

  @observable
  ObservableStream<List<AtletaModel>> atletaList;

  @action
  getList(){
    atletaList = atletaService.get().asObservable();
  }

  @action
  save(AtletaModel model){
    atletaService.save(model);
  }

  @action
  delete(AtletaModel model){
    atletaService.delete(model);
  }
  
}